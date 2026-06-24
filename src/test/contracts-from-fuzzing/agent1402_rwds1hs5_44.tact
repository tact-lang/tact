contract ManySerializations {
    a: Int as uint2;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as coins;
    h: Int;

    init() {
        self.a=1; self.b=-2; self.c=3; self.d=-4;
        self.e=5; self.f=-6; self.g=ton("1"); self.h=7;
    }
}