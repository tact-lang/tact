contract MultiSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;

    init() {
        self.a = 255;
        self.b = -100000;
        self.c = 1000000000;
        self.d = -1;
    }
}