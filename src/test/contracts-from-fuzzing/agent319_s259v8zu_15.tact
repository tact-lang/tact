contract TestBits {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint4;
    d: Int as uint8;
    e: Int as uint16;
    f: Int as uint32;
    g: Int as uint64;
    h: Int as uint128;
    i: Int as uint256;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=6; self.g=7; self.h=8; self.i=9;
    }
}