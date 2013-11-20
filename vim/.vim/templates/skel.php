<?php
if (!class_exists("@FILE@_engine")) {
	/**
	 *
	 * This is the short Description for the Class
	 *
	 * This is the long description for the Class
	 *
	 * @author      KARASZI Istvan <ikaraszi@adverticum.com>
	 * @copyright   (c) Adverticum Zrt. http://adverticum.com/
	 * @version     $Id: skel.php 361 2008-09-02 11:04:33Z raszi $
	 * @package     xpps
	 * @subpackage  SubPackage
	 */
	class @FILE@_engine extends xpps_module_engine {
		public static $revision = '$Revision: 361 $';

		/**
		 * title of the module
		 * @var       string
		 * @access    public
		 */
		public $title = "";

		/**
		 *
		 * constructor for @FILE@
		 *
		 * @param     string    $node          XML node of the module
		 * @access    public
		 */
		function __construct( &$node ) {
			parent::__construct($node);
		}

		/**
		 *
		 * parse base parameters
		 *
		 * @return    boolean                  parsed or not
		 * @param     array     $bp            base parameters
		 * @access    public
		 */
		public function parseBaseParams( $bp ) {
		}

		/**
		 *
		 * initialize module
		 *
		 * @access    public
		 */
		public function initialize() {
		}

		/**
		 *
		 * generate module
		 *
		 * @return    string                   parsed output
		 * @access    public
		 */
		public function generate() {
		}
	}
}
?>
