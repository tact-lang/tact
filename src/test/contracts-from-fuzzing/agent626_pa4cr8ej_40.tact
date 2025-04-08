contract MultiSerialization {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint1;
    d: Int as int16;

    init() {
        self.a = 250;
        self.b = -100;
        self.c = 1;
        self.d = 32000;
    }
}