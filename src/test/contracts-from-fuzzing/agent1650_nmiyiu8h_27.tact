contract FieldOrdering {
    a: Int as uint16;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int32;

    init() {
        self.a = 100;
        self.b = -5;
        self.c = 123456789;
        self.d = -8888;
    }
}