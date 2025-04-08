contract TestContract {
    x: Int as uint64;
    y: Int as int32;
    z: Int as uint8;

    init() {
        self.x = 12345678;
        self.y = -123456;
        self.z = 255;
    }
}