contract VariantSizes {
    a: Int as int8;
    b: Int as uint64;
    c: Int as coins;

    init() {
        self.a = 5;
        self.b = 50000;
        self.c = ton("1");
    }
}