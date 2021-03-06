﻿

// ______________________________________________________________________
//                                              DisplayObject3D: Triangle

import org.papervision3d.core.geom.Face3D;
import org.papervision3d.core.geom.Vertex3D;
import org.papervision3d.core.NumberUV;
import org.papervision3d.core.proto.MaterialObject3D;
import org.papervision3d.objects.Mesh;

/**
* The Plane DisplayObject3D class lets you create and display flat rectangles in 3D space.
* <p/>
* The rectangle can be divided in smaller segments. This is usually done to reduce linear mapping artifacts. Dividing the plane in the direction of the perspective or vanishing point, helps to reduce this problem.
* <p/>
* This problem dissapears when the plane is facing straignt to the camera, i.e. it is perpendicular with the vanishing point of the scene.
*/
class org.papervision3d.objects.Triangle extends Mesh
{
	/**
	* Default size of Plane if not texture is defined.
	*/
	static public var DEFAULT_SIZE :Number = 500;

	// ___________________________________________________________________________________________________
	//                                                                                               N E W
	// NN  NN EEEEEE WW    WW
	// NNN NN EE     WW WW WW
	// NNNNNN EEEE   WWWWWWWW
	// NN NNN EE     WWW  WWW
	// NN  NN EEEEEE WW    WW

	/**
	* Create new Plane object.
	* <p/>
	* @param	material	A Material3D object that contains the material properties of the object.
	* <p/>
	* @param	scale		[optional] - Scaling factor
	* <p/>
	* @param	segmentsW	[optional] - Number of segments horizontally. Defaults to 1.
	* <p/>
	* @param	segmentsH	[optional] - Number of segments vertically. Defaults to segmentsW.
	* <p/>
	* @param	initObject	[optional] - An object that contains user defined properties with which to populate the newly created DisplayObject3D.
	* <p/>
	* It includes x, y, z, rotationX, rotationY, rotationZ, scaleX, scaleY scaleZ and a user defined extra object.
	* <p/>
	* If extra is not an object, it is ignored. All properties of the extra field are copied into the new instance. The properties specified with extra are publicly available.
	*/
	public function Triangle( material:MaterialObject3D, initObject:Object )
	{
		super( material, new Array(), new Array(), initObject );

		buildTriangle();
	}


	private function buildTriangle()
	{
		var vertices :Array      = this.vertices;
		var faces    :Array      = this.faces;

		// Vertices
		for( var i:Number = 0; i < 3; i++ )
		{
			vertices.push( new Vertex3D( 0, 0, 0 ) );
		}

		// Faces
		var uvA :NumberUV;
		var uvC :NumberUV;
		var uvB :NumberUV;

		var a:Vertex3D = vertices[ 0 ];
		var c:Vertex3D = vertices[ 1 ];
		var b:Vertex3D = vertices[ 2 ];

		uvA =  new NumberUV();
		uvC =  new NumberUV();
		uvB =  new NumberUV();

		faces.push( new Face3D( [ a, b, c ], null, [ uvA, uvB, uvC ] ) );

		// Remap UVs
//		transformUV( this._material );
	}
}