contract ManyInts {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as int64;

    init() {
        self.a = 1;
        self.b = 255;
        self.c = -32768;
        self.d = 4294967295;
        self.e = -100000000000;
    }
}