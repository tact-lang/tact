contract TestContract {
    foo: Int as int64 = 10;
    bar: Int as uint8 = 255;
    baz: Int as uint1 = 1;
    qux: Int as int1 = 0;

    init() {
        self.foo = 20;
        self.bar = 100;
        self.baz = 1;
        self.qux = 0;
    }
}