contract SerializeDefaults {
    foo: Int as uint8 = 1;
    bar: Int as uint16 = 257;
    baz: Int as int5 = -3;
    qux: Int as uint1 = 1;

    init() {
        self.foo = 2;
        self.bar = 500;
        self.baz = -1;
        self.qux = 0;
    }
}
