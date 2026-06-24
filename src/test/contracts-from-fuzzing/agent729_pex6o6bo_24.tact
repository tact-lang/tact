contract ExplicitSerialization {
    foo: Int as uint4;
    bar: Int as int8;
    baz: Int as uint16;

    init() {
        self.foo = 7;
        self.bar = -8;
        self.baz = 65535;
    }

    receive() {}
}