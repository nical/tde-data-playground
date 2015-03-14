{
    type: "js",
    generator: function() {
        var geom = {
            positions: [],
            normals: [],
        }

        var transform = mat4.create();
        console.log("lalala");
        var base_path = circle_path_vec3([0,0,0], 25, 16);
        console.log("yayaya");
        
        mat4.multiply(transform, transform, translate(0,20,0));
        var transformed_path = transform_paths([base_path], transform)[0];

        apply_fn(geom, [base_path], [transformed_path]);

        fill_convex_ring(geom, transformed_path);

        console.log(geom.positions);
        console.log(geom.normals);

        return {
            buffers: [
              make_vbo(POS, geom.positions),
              make_vbo(NORMAL, geom.normals),
            ],
            mode: gl.TRIANGLES,
            vertex_count: geom.positions.length / 3
        }
    }
}
