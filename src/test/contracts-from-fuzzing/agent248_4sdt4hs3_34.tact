contract IntSizes {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint64;
    g: Int as int128;
    h: Int as int257;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
        self.e=5; self.f=6; self.g=7; self.h=8;
    }
}