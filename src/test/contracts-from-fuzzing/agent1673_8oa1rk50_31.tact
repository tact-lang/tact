contract MixSerialOpt {
    a: Int as uint8;
    b: Int?;
    c: Int as uint16;
    d: Int?;
    e: Int;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 256;
        self.d = null;
        self.e = 1000;
    }
}