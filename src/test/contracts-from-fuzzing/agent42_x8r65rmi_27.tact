contract IntSerializations {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as int257;
    f: Int as uint256;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
    }
}