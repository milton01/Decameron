<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
// ---------------------------------------------------------------------
class Languagecheck extends CI_Controller {


	private $reference = 'english';

	private $lang_path = 'language';

	// -----------------------------------------------------------------

	/*
	
	 */
	function Languagecheck()
	{
		parent::Controller();
	}

	// -----------------------------------------------------------------

	/*
	
	 */
	function _remap()
	{
		// cargar los ayudantes requeridos
		$this->load->helper('directory');

		// por simplicidad, que no usamos vistas
		$this->output('h1', 'Decameron - Verificación y validación de archivos de idioma');

		//determinar la ruta de archivo de idioma
		if ( ! is_dir($this->lang_path) )
		{
			$this->lang_path = APPPATH . $this->lang_path;

			if ( ! is_dir($this->lang_path) )
			{
				$this->output('h2', 'Camino lenguaje definido "'.$this->lang_path.'" not found!', TRUE);
				exit;
			}
		}

		// 
		$languages = directory_map( $this->lang_path, TRUE );

		// 
		if ( ! in_array($this->reference, $languages ) )
		{
			$this->output('h2', 'Reference language "'.$this->reference.'" not found!', TRUE);
			exit;
		}

		// 
		$references = directory_map( $this->lang_path . '/' . $this->reference, TRUE );

		// 
		foreach( $references as $reference )
		{
			// 
			if ( strpos($reference, '_lang'.EXT) === FALSE )
			{
				continue;
			}

			// 
			$this->output('h2', 'Processing '.$this->reference . ' &raquo; ' .$reference);

			// 
			include $this->lang_path . '/' . $this->reference . '/' . $reference;

			// did the file contain any language strings?
			if ( empty($lang) )
			{
				// language file was empty or not properly defined
				$this->output('h3', 'Language file doesn\'t contain any language strings. Skipping file!', TRUE);
				continue;
			}

			$lang_ref = $lang;
			unset($lang);

			foreach ( $languages as $language )
			{
				if ( $language == $this->reference )
				{
					continue;
				}

				$file = $this->lang_path . '/' . $language . '/' . $reference;

				if ( ! file_exists( $file ) )
				{
					$this->output('h3', 'Language file doesn\'t exist for the language '.$language.'!', TRUE);
				}
				else
				{
					include $file;

					if ( empty($lang) )
					{
						$this->output('h3', 'Language file for the language '.$language.' doesn\'t contain any language strings!', TRUE);
					}
					else
					{
						$this->output('h3', 'Comparing with the '.$language.' version:');

						$failures = 0;

						foreach( $lang_ref as $key => $value )
						{
							if ( ! isset($lang[$key]) )
							{
								$this->output('', 'Missing language string "'.$key.'"', TRUE);

								$failures++;
							}
						}

						if ( ! $failures )
						{
							$this->output('', 'The two language files have matching strings.');
						}
					}

					if ( isset($lang) )
					{
						unset($lang);
					}
				}
			}

		}

		$this->output('h2', 'Language file checking and validation completed');
	}

	// -----------------------------------------------------------------

	private function output($type = '', $line = '', $highlight = FALSE)
	{
		switch ($type)
		{
			case 'h1':
				$html = "<h1>{line}</h1>\n<hr />\n";
				break;

			case 'h2':
				$html = "<h2>{line}</h2>\n";
				break;

			case 'h3':
				$html = "<h3>&nbsp;&nbsp;&nbsp;{line}</h3>\n";
				break;

			default:
				$html = "&nbsp;&nbsp;&nbsp;&nbsp;&raquo;&nbsp;{line}<br />";
				break;
		}

		if ( $highlight )
		{
			$line = '<span style="color:red;font-weight:bold;">' . $line . '</span>';
		}

		echo str_replace('{line}', $line, $html);
	}
	// -----------------------------------------------------------------

}

/* End of file languagecheck.php */
/* Location: ./application/controllers/languagecheck.php */
