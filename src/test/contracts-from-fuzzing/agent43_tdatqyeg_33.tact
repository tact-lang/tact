contract SerialFormats {
    a: Int as int4;
    b: Int as uint4;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int64;
    f: Int as uint64;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5; self.f=6;
    }
}