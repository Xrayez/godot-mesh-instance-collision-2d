extends StaticBody2D


func _ready() -> void:
	# Get triangles points from mesh
	var points = $MeshInstance.mesh.get_faces()
	
	var idx = 0
	var shapes = []
	
	while idx < points.size():
		
		# Each three vertices represent one triangle
		# Converts automatically from Vector3 to Vector2!
		var tri_points = PoolVector2Array([points[idx], points[idx + 1], points[idx + 2]])
		
		# Create an actual triangle shape
		var tri_shape = ConvexPolygonShape2D.new()
		tri_shape.points = tri_points
		shapes.push_back(tri_shape)
		
		idx += 3
		
	for sh in shapes:
		# Add created shapes to collision body
		shape_owner_add_shape(0, sh)
	