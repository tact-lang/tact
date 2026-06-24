contract MixedSerialize {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint64;
    e: Bool;
    init() {
        self.a = -5;
        self.b = 100;
        self.c = 10000;
        self.d = 1000000;
        self.e = true;
    }
}