contract MixedSerialization {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int;

    init() {
        self.a = 3;
        self.b = -7;
        self.c = 1234;
        self.d = -123456;
        self.e = 1000000;
    }
}