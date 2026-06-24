contract SerializeOrder {
    a: Int as uint8;
    b: Int as int64;
    c: Int;

    init() {
        self.a = 5;
        self.b = 10000;
        self.c = -1;
    }
}
