contract SerializeMix {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Int as int257;

    init() {
        self.a = 255;
        self.b = -9999;
        self.c = 123456;
        self.d = -123456;
    }
}