contract TestContract {
    foo: Int as uint8;
    bar: Int as int16;
    baz: Bool;
    qux: String?;

    init() {
        self.foo = 1;
        self.bar = -123;
        self.baz = true;
        self.qux = null;
    }
}