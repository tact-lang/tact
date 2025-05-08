contract IntFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a=200;
        self.b=-30000;
        self.c=1234567890;
        self.d=-5000000000;
        self.e=5000000000000000;
    }
}