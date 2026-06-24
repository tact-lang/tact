contract SerializationConflict {
    x: Int as int64;
    y: Int as uint8;
    z: Int;

    init() {
        self.x = 100;
        self.y = 5;
        self.z = 1;
    }
}
