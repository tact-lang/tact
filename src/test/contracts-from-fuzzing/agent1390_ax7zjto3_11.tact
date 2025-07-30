contract ManyInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint24;
    d: Int as uint32;
    e: Int as uint64;
    f: Int as uint128;
    g: Int as uint256;
    h: Int = 0;
    
    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
        self.e=5; self.f=6; self.g=7; self.h=8;
    }
}