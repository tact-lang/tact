contract IntSerializedSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int4;
    e: Int as uint1;

    init() {
        self.a = 1;
        self.b = -3;
        self.c = 100;
        self.d = 5;
        self.e = 1;
    }
}