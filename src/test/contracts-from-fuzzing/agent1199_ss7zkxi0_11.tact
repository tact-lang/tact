contract TestContract {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as int64;
    w: Int as coins;
    q: Int;

    init() {
        self.x = 1;
        self.y = 255;
        self.z = -1234567890;
        self.w = 1000000000;
        self.q = 42;
    }
}