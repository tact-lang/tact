contract Test {
    x: Int as uint8;
    y: Int as int64;
    z: Int as int257;

    init() {
        self.x = 42;
        self.y = -100000;
        self.z = 12345678901234567890123456789;
    }
}
