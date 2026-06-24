contract MixedIntSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int;

    init() {
        self.a = 100;
        self.b = -999999;
        self.c = 123456;
    }
}