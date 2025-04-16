contract MixedSerializations {
    a: Int as int64;
    b: Int as uint32;
    c: Int;

    init() {
        self.a = 100;
        self.b = 200;
        self.c = 300;
    }
}
