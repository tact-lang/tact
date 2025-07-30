// Mix of serialization sizes in contract persistent fields
contract MixSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    f: Int;

    init() {
        self.a = 200;
        self.b = -32000;
        self.c = 4300000000;
        self.d = -1234567890123;
        self.e = 123456789123456789123456789;
        self.f = -1;
    }
}