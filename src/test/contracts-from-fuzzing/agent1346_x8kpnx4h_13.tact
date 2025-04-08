contract MixedSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;

    init() {
        self.a = 5;
        self.b = -25;
        self.c = 123456789;
    }
}