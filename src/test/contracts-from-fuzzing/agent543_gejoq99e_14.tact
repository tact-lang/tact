contract MixedSerialized {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int;

    init() {
        self.a = 1;
        self.b = -10;
        self.c = 1000;
        self.d = 9999999;
    }
}
