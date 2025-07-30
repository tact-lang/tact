contract SimpleInts {
    x: Int;
    y: Int as uint8;
    z: Int as int64;

    init() {
        self.x = 0;
        self.y = 255;
        self.z = -42;
    }
}
