contract FieldOrdering {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int64 = 3;
    d: Int = 4;

    init() {
        self.a = 5;
        self.b = 6;
        self.c = 7;
        self.d = 8;
    }
}