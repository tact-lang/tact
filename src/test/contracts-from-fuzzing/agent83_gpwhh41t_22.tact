contract LargeInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;

    init() {
        self.a=1;self.b=-1;self.c=2;self.d=3;self.e=4;self.f=5;
    }
}
