contract MixWithSerialization {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint128;
    d: Int;

    init() {
        self.a = 100;
        self.b = -4567;
        self.c = 9999999;
        self.d = 10;
    }
}