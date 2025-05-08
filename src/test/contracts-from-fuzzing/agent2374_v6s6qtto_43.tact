contract WithManySerializations {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int as int8;
    g: Int as int16;
    h: Int as int32;
    i: Int as int64;
    j: Int as int128;

    init() {
        self.a=1;self.b=2;self.c=3;self.d=4;self.e=5;
        self.f=-1;self.g=-2;self.h=-3;self.i=-4;self.j=-5;
    }
}