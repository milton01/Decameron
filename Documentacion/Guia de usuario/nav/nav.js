function create_menu(basepath)
{
	var base = (basepath == 'null') ? '' : basepath;

	document.write(
		'<table cellpadding="0" cellspaceing="0" border="0" style="width:98%"><tr>' +
		'<td class="td" valign="top">' +

		'<ul>' +
		'<li><a href="'+base+'index.html">Inicio</a></li>' +
		'<li><a href="'+base+'toc.html">Tabla de Contenido</a></li>' +
		'</ul>' +

		'<h3>Información Básica</h3>' +
		'<ul>' +
			'<li><a href="'+base+'general/requirements.html">Requisitos del Servidor</a></li>' +
			'<li><a href="'+base+'license.html">Acuerdo de Licencia</a></li>' +
			'<li><a href="'+base+'changelog.html">Registro de Cambios</a></li>' +
			'<li><a href="'+base+'general/credits.html">Créditos</a></li>' +
		'</ul>' +

		'<h3>Instalación</h3>' +
		'<ul>' +
			'<li><a href="'+base+'installation/downloads.html">Descargar CodeIgniter</a></li>' +
			'<li><a href="'+base+'installation/index.html">Instrucciones de Instalación</a></li>' +
			'<li><a href="'+base+'installation/upgrading.html">Actualizar desde una Versión Anterior</a></li>' +
			'<li><a href="'+base+'installation/troubleshooting.html">Solución de Problemas</a></li>' +
		'</ul>' +

		'<h3>Introducción</h3>' +
		'<ul>' +
			'<li><a href="'+base+'overview/getting_started.html">Primeros Pasos</a></li>' +
			'<li><a href="'+base+'overview/at_a_glance.html">Un Vistazo a CodeIgniter</a></li>' +
			'<li><a href="'+base+'overview/cheatsheets.html">Hojas de Referencia</a></li>' +
			'<li><a href="'+base+'overview/features.html">Funcionalidades de CodeIgniter</a></li>' +
			'<li><a href="'+base+'overview/appflow.html">Diagrama de Flujo de la Aplicación</a></li>' +
			'<li><a href="'+base+'overview/mvc.html">Modelo-Vista-Controlador</a></li>' +
			'<li><a href="'+base+'overview/goals.html">Metas Arquitectónicas</a></li>' +
		'</ul>' +

		
		'<h3>Tutorial</h3>' +
		'<ul>' +
			'<li><a href="'+base+'tutorial/index.html">Introducción</a></li>' +
			'<li><a href="'+base+'tutorial/static_pages.html">Páginas Estáticas</a></li>' +
			'<li><a href="'+base+'tutorial/news_section.html">Sección de Noticias</a></li>' +
			'<li><a href="'+base+'tutorial/create_news_items.html">Crear Ítems de Noticias</a></li>' +
			'<li><a href="'+base+'tutorial/conclusion.html">Conclusión</a></li>' +
		'</ul>' +
		
		'</td><td class="td_sep" valign="top">' +

		'<h3>Temas generales</h3>' +
		'<ul>' +
			'<li><a href="'+base+'general/urls.html">URLs de CodeIgniter</a></li>' +
			'<li><a href="'+base+'general/controllers.html">Controladores</a></li>' +
			'<li><a href="'+base+'general/reserved_names.html">Palabras Reservadas</a></li>' +
			'<li><a href="'+base+'general/views.html">Vistas</a></li>' +
			'<li><a href="'+base+'general/models.html">Modelos</a></li>' +
			'<li><a href="'+base+'general/helpers.html">Helpers</a></li>' +
			'<li><a href="'+base+'general/libraries.html">Usar Librerías de CodeIgniter</a></li>' +
			'<li><a href="'+base+'general/creating_libraries.html">Crear tus Propias Librerías</a></li>' +
			'<li><a href="'+base+'general/drivers.html">Usar Drivers de CodeIgniter</a></li>' +
			'<li><a href="'+base+'general/creating_drivers.html">Crear tus Propios Drivers</a></li>' +
			'<li><a href="'+base+'general/core_classes.html">Crear Clases del Núcleo</a></li>' +
			'<li><a href="'+base+'general/hooks.html">Hooks - Extender el Núcleo</a></li>' +
			'<li><a href="'+base+'general/autoloader.html">Auto-carga de Recursos</a></li>' +
			'<li><a href="'+base+'general/common_functions.html">Funciones Comunes</a></li>' +
			'<li><a href="'+base+'general/routing.html">Ruteo URI</a></li>' +
			'<li><a href="'+base+'general/errors.html">Manejo de Errores</a></li>' +
			'<li><a href="'+base+'general/caching.html">Caché de Páginas</a></li>' +
			'<li><a href="'+base+'general/profiling.html">Perfilando tu Aplicación</a></li>' +
			'<li><a href="'+base+'general/cli.html">Ejecutar Mediante la CLI</a></li>' +
			'<li><a href="'+base+'general/managing_apps.html">Administrar Aplicaciones</a></li>' +
			'<li><a href="'+base+'general/environments.html">Manejo de Múltiples Entornos</a></li>' +
			'<li><a href="'+base+'general/alternative_php.html">Sintaxis Alternativa de PHP</a></li>' +
			'<li><a href="'+base+'general/security.html">Seguridad</a></li>' +
			'<li><a href="'+base+'general/styleguide.html">Guía de Estilo PHP</a></li>' +
			'<li><a href="'+base+'doc_style/index.html">Escribir Documentación</a></li>' +
		'</ul>' +

		'<h3>Recursos Adicionales</h3>' +
		'<ul>' +
		'<li><a href="http://codeigniter.com/forums/">Foros de la Comunidad</a></li>' +
		'<li><a href="http://codeigniter.com/wiki/">Wiki de la Comunidad</a></li>' +
		'</ul>' +

		'</td><td class="td_sep" valign="top">' +


		'<h3>Referencia de Classes</h3>' +
		'<ul>' +
		'<li><a href="'+base+'libraries/benchmark.html">Clase Benchmarking</a></li>' +
		'<li><a href="'+base+'libraries/calendar.html">Clase Calendar</a></li>' +
		'<li><a href="'+base+'libraries/cart.html">Clase Cart</a></li>' +
		'<li><a href="'+base+'libraries/config.html">Clase Config</a></li>' +
		'<li><a href="'+base+'libraries/email.html">Clase Email</a></li>' +
		'<li><a href="'+base+'libraries/encryption.html">Clase Encrypt</a></li>' +
		'<li><a href="'+base+'libraries/form_validation.html">Clase Form Validation</a></li>' +
		'<li><a href="'+base+'libraries/ftp.html">Clase FTP</a></li>' +
		'<li><a href="'+base+'libraries/image_lib.html">Clase Image_lib</a></li>' +
		'<li><a href="'+base+'libraries/input.html">Clase Input</a></li>' +
		'<li><a href="'+base+'libraries/javascript.html">Clase Javascript</a></li>' +
		'<li><a href="'+base+'libraries/language.html">Clase Lang</a></li>' +
		'<li><a href="'+base+'libraries/loader.html">Clase Load</a></li>' +
		'<li><a href="'+base+'libraries/migration.html">Clase Migration</a></li>' +
		'<li><a href="'+base+'libraries/output.html">Clase Output</a></li>' +
		'<li><a href="'+base+'libraries/pagination.html">Clase Pagination</a></li>' +
		'<li><a href="'+base+'libraries/parser.html">Clase Parser</a></li>' +
		'<li><a href="'+base+'libraries/security.html">Clase Security</a></li>' +
		'<li><a href="'+base+'libraries/sessions.html">Clase Session</a></li>' +
		'<li><a href="'+base+'libraries/table.html">Clase Table</a></li>' +
		'<li><a href="'+base+'libraries/trackback.html">Clase Trackbacks</a></li>' +
		'<li><a href="'+base+'libraries/typography.html">Clase Typography</a></li>' +
		'<li><a href="'+base+'libraries/unit_testing.html">Clase Unit_test</a></li>' +
		'<li><a href="'+base+'libraries/file_uploading.html">Clase Upload</a></li>' +
		'<li><a href="'+base+'libraries/uri.html">Clase URI</a></li>' +
		'<li><a href="'+base+'libraries/user_agent.html">Clase User_agent</a></li>' +
		'<li><a href="'+base+'libraries/xmlrpc.html">Clase XML-RPC</a></li>' +
		'<li><a href="'+base+'libraries/zip.html">Clase Zip</a></li>' +
		'</ul>' +

		'</td><td class="td_sep" valign="top">' +

		'<h3>Referencia de Controladores</h3>' +
		'<ul>' +
		'<li><a href="'+base+'libraries/caching.html">Clase Caching</a></li>' +
		'<li><a href="'+base+'database/index.html">Clase Database</a></li>' +
		'</ul>' +

		'<h3>Referencia de Helpers</h3>' +
		'<ul>' +
		'<li><a href="'+base+'helpers/array_helper.html">Helper Arrays</a></li>' +
		'<li><a href="'+base+'helpers/captcha_helper.html">Helper CAPTCHA</a></li>' +
		'<li><a href="'+base+'helpers/cookie_helper.html">Helper Cookies</a></li>' +
		'<li><a href="'+base+'helpers/date_helper.html">Helper Date</a></li>' +
		'<li><a href="'+base+'helpers/directory_helper.html">Helper Direcory</a></li>' +
		'<li><a href="'+base+'helpers/download_helper.html">Helper Download</a></li>' +
		'<li><a href="'+base+'helpers/email_helper.html">Helper Emails</a></li>' +
		'<li><a href="'+base+'helpers/file_helper.html">Helper File</a></li>' +
		'<li><a href="'+base+'helpers/form_helper.html">Helper Form</a></li>' +
		'<li><a href="'+base+'helpers/html_helper.html">Helper HTML</a></li>' +
		'<li><a href="'+base+'helpers/inflector_helper.html">Helper Inflector</a></li>' +
		'<li><a href="'+base+'helpers/language_helper.html">Helper Language</a></li>' +
		'<li><a href="'+base+'helpers/number_helper.html">Helper Number</a></li>' +
		'<li><a href="'+base+'helpers/path_helper.html">Helper Path</a></li>' +
		'<li><a href="'+base+'helpers/security_helper.html">Helper Security</a></li>' +
		'<li><a href="'+base+'helpers/smiley_helper.html">Helper Smiley</a></li>' +
		'<li><a href="'+base+'helpers/string_helper.html">Helper String</a></li>' +
		'<li><a href="'+base+'helpers/text_helper.html">Helper Text</a></li>' +
		'<li><a href="'+base+'helpers/typography_helper.html">Helper Typography</a></li>' +
		'<li><a href="'+base+'helpers/url_helper.html">Helper URL</a></li>' +
		'<li><a href="'+base+'helpers/xml_helper.html">Helper XML</a></li>' +
		'</ul>' +

		'</td></tr></table>');
}
