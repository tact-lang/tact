contract OptionalSerializeCollision {
    x: Int? as uint32;
    y: Int? as uint32;
    z: Int? as uint32;

    init() {
        self.x = null;
        self.y = 42;
        self.z = null;
    }
}
