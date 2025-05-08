contract MixSerialization {
    a: Int as uint32;
    b: Int;
    c: Int as int64;

    init() {
        self.a = 13;
        self.b = -77;
        self.c = 999;
    }
}