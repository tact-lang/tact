contract BigInts {
    a: Int as int257;
    b: Int as uint256;
    init() {
        self.a = -1;
        self.b = 1 << 255;
    }
}