contract CompactSerialization {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint4;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
    }
}