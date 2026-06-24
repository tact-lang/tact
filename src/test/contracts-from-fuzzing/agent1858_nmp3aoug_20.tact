contract MixSerialization {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;

    init() {
        self.a = 5;
        self.b = -42;
        self.c = 1000000000;
        self.d = 123456789012345;
    }
}