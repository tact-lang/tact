contract SerializeManyInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int257;
    f: Int as uint8;
    g: Int as uint16;
    h: Int as uint32;
    i: Int as uint64;
    j: Int as coins;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=6; self.g=7; self.h=8; self.i=9; self.j=ton("1");
    }
}