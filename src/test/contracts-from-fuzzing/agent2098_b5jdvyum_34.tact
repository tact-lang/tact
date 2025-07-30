contract IntSerializationContract {
    a: Int as int8;
    b: Int as int16;
    c: Int as int64;
    d: Int as uint8;
    e: Int as uint16;
    f: Int as uint64;

    init() {
        self.a = -10;
        self.b = -300;
        self.c = -40000000;
        self.d = 250;
        self.e = 65000;
        self.f = 40000000;
    }
}
