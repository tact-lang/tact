contract ByteSerializeInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int8;
    e: Int as int16;
    f: Int as int32;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = -4;
        self.e = -5;
        self.f = -6;
    }
}
