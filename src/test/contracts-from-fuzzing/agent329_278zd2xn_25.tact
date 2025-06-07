contract TestContract {
    foo: Int as int64;
    bar: Int as uint8;
    baz: Int as uint256;
    qux: Int as coins;

    init() {
        self.foo = -10000000000;
        self.bar = 255;
        self.baz = 1234567890123456789;
        self.qux = 1_000_000_000;
    }
}