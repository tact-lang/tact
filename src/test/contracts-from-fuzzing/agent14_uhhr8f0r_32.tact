contract Test {
    foo: Int as uint128;
    bar: Int as int64;

    init() {
        self.foo = 123;
        self.bar = -456;
    }
}