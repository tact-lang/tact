contract MixSerializationFormats {
    a: Int as uint32;
    b: Int as int64;
    c: Int as int4;
    d: Int as uint8;
    e: Int;
    f: Int? as uint16;
    g: Int? as int7;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = -3;
        self.d = 4;
        self.e = 5;
        self.f = null;
        self.g = null;
    }
}