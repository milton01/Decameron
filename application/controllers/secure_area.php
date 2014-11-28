<?php
class Secure_area extends CI_Controller 
{
	/*
	Los controladores que son considerados seguros extender Secure_area, opcionalmente, un $ module_id puede
ser configurado para comprobar también si un usuario puede acceder a un módulo particular en el sistema.
	*/
	function __construct($module_id=null)
	{
		parent::__construct();	
		$this->load->model('Employee');
		if(!$this->Employee->is_logged_in())
		{
			redirect('login');
		}
		
		if(!$this->Employee->has_permission($module_id,$this->Employee->get_logged_in_employee_info()->person_id))
		{
			redirect('no_access/'.$module_id);
		}
		
		//cargar datos globales
		$logged_in_employee_info=$this->Employee->get_logged_in_employee_info();
		$data['allowed_modules']=$this->Module->get_allowed_modules($logged_in_employee_info->person_id);
		$data['user_info']=$logged_in_employee_info;
		$this->load->vars($data);
	}
	
	function _remove_duplicate_cookies ()
	{
		//
		if (function_exists('header_remove'))
		{
			$CI = &get_instance();
	
			// limpia
			$headers             = headers_list();
			$cookies_to_output   = array ();
			$header_session_cookie = '';
			$session_cookie_name = $CI->config->item('sess_cookie_name');
	
			foreach ($headers as $header)
			{
				list ($header_type, $data) = explode (':', $header, 2);
				$header_type = trim ($header_type);
				$data        = trim ($data);
	
				if (strtolower ($header_type) == 'set-cookie')
				{
					header_remove ('Set-Cookie');
	
					$cookie_value = current(explode (';', $data));
					list ($key, $val) = explode ('=', $cookie_value);
					$key = trim ($key);
	
					if ($key == $session_cookie_name)
					{
						// 
						$header_session_cookie = $data;
						continue;
					}
					else
					{
						// 
						$cookies_to_output[] = array ('header_type' => $header_type, 'data' => $data);
					}
				}
			}
	
			if ( ! empty ($header_session_cookie))
			{
				$cookies_to_output[] = array ('header_type' => 'Set-Cookie', 'data' => $header_session_cookie);
			}
	
			foreach ($cookies_to_output as $cookie)
			{
				header ("{$cookie['header_type']}: {$cookie['data']}", false);
			}
		}
	}
}
?>