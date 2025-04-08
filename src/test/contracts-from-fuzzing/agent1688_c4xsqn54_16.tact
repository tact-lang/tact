struct Vec3 { x: Int; y: Int; z: Int; }

struct WrapVec3 {
    vec: Vec3;
    magnitude: Int;
}

contract VectorTest {
    data: WrapVec3;

    init() {
        self.data = WrapVec3 {
            vec: Vec3 { x: 1, y: 2, z:3 },
            magnitude: 42
        };
    }
}