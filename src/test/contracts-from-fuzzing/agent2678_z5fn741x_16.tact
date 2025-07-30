contract SerializeSizes {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;

    init() {
        self.x = 5;
        self.y = -12345;
        self.z = 123456;
    }
}