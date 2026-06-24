contract VariousSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int; // default int257
    d: Int as uint64;
    e: Int?;
    f: Int? as uint32;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = 4;
        self.e = null;
        self.f = null;
    }
}