// contract flat storage serialization stress
contract TestContract {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;
    i: Int as uint128;
    j: Int as int128;
    k: Bool;
    l: Bool;

    init() {
        self.a=1;self.b=-1;self.c=2;self.d=-2;self.e=3;self.f=-3;
        self.g=4;self.h=-4;self.i=5;self.j=-5;self.k=true;self.l=false;
    }

    receive() {
        self.a=10;self.b=-10;self.c=20;self.d=-20;self.e=30;self.f=-30;
        self.g=40;self.h=-40;self.i=50;self.j=-50;self.k=false;self.l=true;
    }
}