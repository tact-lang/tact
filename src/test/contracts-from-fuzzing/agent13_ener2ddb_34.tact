contract MixedSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
    d: Int as uint8;
    e: Int as int257;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}