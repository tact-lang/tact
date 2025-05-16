contract ManyTypes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
    d: Int as int257;
    e: Int as coins;

    init() {
        self.a = 255;
        self.b = -32000;
        self.c = 1000000000000;
        self.d = 0;
        self.e = 123000;
    }
}