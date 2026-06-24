contract MixedSer {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}