
// ______________________________________________________________________
//                                                       MaterialObject3D

import org.papervision3d.core.proto.SceneObject3D;

import flash.display.BitmapData;

/**
* The MaterialObject3D class collects data about how objects appear when rendered.
*
* A material is data that you assign to objects or faces, so that they appear a certain way when rendered. Materials affect the line and fill colors.
*
* Materials create greater realism in a scene. A material describes how an object reflects or transmits light. You assign materials to individual objects or a selection of faces; a single object can contain different materials.
*
*/
class org.papervision3d.core.proto.MaterialObject3D
{
	/**
	* A transparent or opaque BitmapData texture.
	*/
	public var bitmap :BitmapData;

	/**
	* A Boolean value that determines whether the texture is animated.
	*
	* If set, the material must be push()ed into the scene so the BitmapData texture can be updated when rendering. The default value is false, which is sligtly faster.
	*/
	public var animated :Boolean;

	/**
	* A Boolean value that determines whether the BitmapData texture is smoothed when rendered.
	*/
	public var smooth :Boolean;


	/**
	* A RGB color value to draw the triangle's outline.
	*/
	public var lineColor :Number;

	/**
	* An 8-bit alpha value for the triangle's outline. If zero, no outline is drawn.
	*/
	public var lineAlpha :Number;


	/**
	* A RGB color value to fill the triangle with. Only used if no texture is provided.
	*/
	public var fillColor :Number;

	/**
	* An 8-bit alpha value fill the triangle with. If this value is zero and no texture is provided or is undefined, a fill is not created.
	*/
	public var fillAlpha :Number;


	/**
	* A Boolean value that indicates whether the triangle is single sided.
	*/
	public var oneSide :Boolean;


	/**
	* A Boolean value that indicates whether the triangle is invisible (not drawn).
	*/
	public var invisible :Boolean;

	/**
	* The scene where the object belongs.
	*/
	public var scene :SceneObject3D;

	/**
	* Default color used for debug.
	*/
	static public var DEFAULT_COLOR :Number = 0xFF00FF;


	/**
	* @param	bitmap		A BitmapData texture.
	* @param	lineColor	An RGB color value to draw the triangle's outline.
	* @param	lineAlpha	An alpha value for the triangle's outline.
	* @param	fillColor	An RGB color value to fill the triangle with. Only used if no texture is provided.
	* @param	fillAlpha	An alpha value for the triangle's fill. Only used if no texture is provided.
	* @param	animated	A Boolean value that determines whether the texture is animated.
	*/
	public function MaterialObject3D( initObject:Object )
	{
		this.bitmap    = initObject.bitmap    || null;

		// Color
		this.lineColor = initObject.lineColor || 0x000000;
		this.lineAlpha = initObject.lineAlpha || 0;

		this.fillColor = initObject.fillColor || 0x000000;
		this.fillAlpha = initObject.fillAlpha || 0;

		this.animated  = initObject.animated  || false;

		// Defaults
		this.invisible = initObject.invisible || false;
		this.smooth    = initObject.smooth    || false;

		this.oneSide   = (initObject.oneSide != false);
	}


	/**
	* Returns a MaterialObject3D object with the default magenta wireframe values.
	*
	* @return A MaterialObject3D object.
	*/
	static public function get DEFAULT():MaterialObject3D
	{
		var defMaterial :MaterialObject3D = new MaterialObject3D();

		defMaterial.lineColor = DEFAULT_COLOR;
		defMaterial.lineAlpha = 100;
		defMaterial.fillColor = DEFAULT_COLOR;
		defMaterial.fillAlpha = 10;
		defMaterial.oneSide = false;

		return defMaterial;
	}


	/**
	* Updates animated MovieClip bitmap.
	*
	* Draws the current MovieClip image onto bitmap.
	*/
	public function updateBitmap() {}


	/**
	* Returns a string value representing the material properties in the specified Material3D object.
	*
	* @return	A string.
	*/
	public function toString(): String
	{
		return '[MaterialObject3D] bitmap:' + this.bitmap + ' lineColor:' + this.lineColor + ' fillColor:' + fillColor;
	}
}