contract VariousSerializationFormats {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 2;
        self.d = -2;
        self.e = 3;
        self.f = -3;
        self.g = 4;
        self.h = -4;
    }
}
