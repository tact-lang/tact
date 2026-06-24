contract ChainOfInts {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint32;
    e: Int as int16;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}