contract Test {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
    h: Int as int64;
    i: Int as coins;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
        self.e=5; self.f=6; self.g=7; self.h=8; self.i=9;
    }
}