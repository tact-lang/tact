contract TestContract {
    x: Int as uint256;
    y: Int as int255;
    z: Int as uint32;
    w: Int as int1;

    init() {
        self.x = 123456789;
        self.y = -42;
        self.z = 4294967295;
        self.w = 1;
    }
}