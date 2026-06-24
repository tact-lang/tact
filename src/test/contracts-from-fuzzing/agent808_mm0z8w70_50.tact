contract TestStructSerialization {
    vec: Vector;

    init() {
        self.vec = Vector{ x: 1, y: 2, z: 3 };
    }
}

struct Vector {
    x: Int as int64;
    y: Int as int64;
    z: Int as int64;
}
