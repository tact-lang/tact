contract TestContract {
    foo: Int as uint32;
    bar: Int? as uint16;
    baz: Int?;
    init() {
        self.foo = 12345;
        self.bar = null;
        self.baz = null;
    }
}