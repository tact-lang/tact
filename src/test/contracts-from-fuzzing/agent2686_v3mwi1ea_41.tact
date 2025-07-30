contract MixSerialize {
    a: Int as uint32;
    b: Int as int64;
    c: Int;
    d: Int? as int32;

    init() {
        self.a = 1000;
        self.b = -100000;
        self.c = 999;
        self.d = -50000;
    }
}
