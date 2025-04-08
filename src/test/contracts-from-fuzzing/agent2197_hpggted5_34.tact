contract MixedSerOpts {
    a: Int?;
    b: Int as uint8;
    c: Int?;
    d: Int as int64;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = null;
        self.d = 7;
    }
}