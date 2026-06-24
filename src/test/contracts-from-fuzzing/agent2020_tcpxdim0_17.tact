contract SerializeIntSizes {
    a: Int as int32;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint8;

    init() {
        self.a = -100;
        self.b = 1234;
        self.c = 100000000000;
        self.d = 255;
    }
}
