<?php return array (
  'plugins.importexport.native.displayName' => 'Módulo XML nativo',
  'plugins.importexport.native.description' => 'Importar y exportar libros en el formato XML nativo.',
  'plugins.importexport.native.import' => 'Importar',
  'plugins.importexport.native.import.instructions' => 'Cargar archivo XML para importar',
  'plugins.importexport.native.export' => 'Exportar',
  'plugins.importexport.native.results' => 'Resultados',
  'plugins.inportexport.native.uploadFile' => 'Cargue un archivo en el apartado "Importar" para continuar.',
  'plugins.importexport.native.importComplete' => 'La importación se ha completado con éxito. Se han importado los siguientes elementos:',
  'plugins.importexport.native.import.error.sectionTitleMismatch' => 'Los títulos de sección "{$section1Title}" y "{$section2Title}" del número "{$issueTitle}" corresponden a las diferentes secciones existentes de la revista.',
  'plugins.importexport.native.import.error.sectionTitleMatch' => 'El título de sección "{$sectionTitle}" del número "{$issueTitle}" se corresponde con una sección existente de la revista, pero otro título de esta sección no se corresponde con un título en la sección existente de la revista.',
  'plugins.importexport.native.import.error.sectionAbbrevMismatch' => 'Las abreviaturas de sección "{$section1Abbrev}" y "{$section2Abbrev}" del número "{$issueTitle}" se corresponden con las diferentes secciones existentes de la revista.',
  'plugins.importexport.native.import.error.sectionAbbrevMatch' => 'La abreviatura de sección "{$sectionAbbrev}" del número "{$issueTitle}" se corresponde con una sección existente de la revista, pero otra abreviatura de esta sección no se corresponde con una abreviatura en la sección existente de la revista.',
  'plugins.importexport.native.exportSubmissionsSelect' => 'Seleccione los artículos para exportar',
  'plugins.importexport.native.exportSubmissions' => 'Exportar artículos',
  'plugins.importexport.native.exportIssues' => 'Exportar números',
  'plugins.importexport.native.cliUsage' => 'Uso: {$scriptName} {$pluginName} [command] ...
Comandos:
	import [xmlFileName] [journal_path] [user_name] ...
	export [xmlFileName] [journal_path] articles [articleId1] [articleId2] ...
	export [xmlFileName] [journal_path] article [articleId]
	export [xmlFileName] [journal_path] issues [issueId1] [issueId2] ...
	export [xmlFileName] [journal_path] issue [issueId]

Se requieren los siguientes parámetros adicionales para importar datos, 
en función del nodo raíz del documento XML.

Si el nodo raíz es <article> o <articles>, se necesitarán parámetros adicionales.
Se aceptan los formatos siguientes:

{$scriptName} {$pluginName} import [xmlFileName] [journal_path] [user_name]
	issue_id [issueId] section_id [sectionId]

{$scriptName} {$pluginName} import [xmlFileName] [journal_path] [user_name]
	issue_id [issueId] section_name [name]

{$scriptName} {$pluginName} import [xmlFileName] [journal_path]
	issue_id [issueId] section_abbrev [abbrev]
',
  'plugins.importexport.native.error.unknownSection' => 'Sección desconocida {$param}',
  'plugins.importexport.native.error.unknownUser' => 'El usuario/a especificado ("{$userName}") no existe.',
  'plugins.importexport.native.import.error.issueIdentificationMatch' => 'Ningún número o más de uno coinciden con la identificación de número proporcionada ("{$issueIdentification}").',
  'plugins.importexport.native.import.error.issueIdentificationDuplicate' => 'El número ya existente con el identificador {$issueId} coincide con el identificador de número proporcionado ("{$issueIdentification}"). Este número no se modificará, pero se añadirán los artículos.',
  'plugins.importexport.native.import.error.issueIdentificationMissing' => 'No se encuentra el elemento identificador de número para el artículo "{$articleTitle}".',
  'plugins.importexport.native.import.error.publishedDateMissing' => 'El artículo "{$articleTitle}" está asignado a un número pero no tiene fecha de publicación.',
);