contract FieldOrdering {
    a: Int as uint8;
    b: Bool;
    c: Int as int64;
    d: Bool;
    e: Int as coins;

    init() {
        self.a = 1;
        self.b = false;
        self.c = -64;
        self.d = true;
        self.e = ton("2.5");
    }
}