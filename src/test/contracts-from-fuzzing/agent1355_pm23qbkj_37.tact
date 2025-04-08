contract ChainSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
    }
}