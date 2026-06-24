contract TestContract {
    foo: Int;
    bar: Int as int8;
    baz: Int as uint16;
    qux: Int as int32;

    init() {
        self.foo = 123;
        self.bar = -5;
        self.baz = 500;
        self.qux = -10000;
    }
}