contract FieldSerialization {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int4;

    init() {
        self.a = 10;
        self.b = 100;
        self.c = -5;
    }
}