contract Test {
    foo: Int as uint8;
    bar: Int as uint16;
    baz: Int as uint32;

    init() {
        self.foo = 1;
        self.bar = 2;
        self.baz = 3;
    }
}