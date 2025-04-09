contract T {
    foo: Int as uint32;
    bar: Int as int64;
    baz: Int as coins;

    init() {
        self.foo = 100;
        self.bar = -50;
        self.baz = ton("1");
    }
}