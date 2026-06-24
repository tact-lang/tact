contract UnsizedIntSerializations {
    x: Int;
    y: Int as int64;
    z: Int as uint8;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = 3;
    }
}