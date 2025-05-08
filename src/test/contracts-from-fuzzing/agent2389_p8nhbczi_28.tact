contract MixSerials {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;

    init() {
        self.a=5;
        self.b=-5;
        self.c=1000;
        self.d=-100000;
        self.e=5000000000;
    }
}