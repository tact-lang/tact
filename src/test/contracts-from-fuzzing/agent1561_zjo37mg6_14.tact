contract WithDifferentIntSerialization {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;

    init() {
        self.a=1; self.b=-2; self.c=3; self.d=-4;
        self.e=5; self.f=-6; self.g=7; self.h=-8;
    }
}
