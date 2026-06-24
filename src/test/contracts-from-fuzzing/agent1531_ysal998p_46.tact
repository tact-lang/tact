contract EdgeSer {
    foo: Int as uint1;
    bar: Int as uint8;
    baz: Int as uint16;
    qux: Int as int257;

    init() {
        self.foo = 1;
        self.bar = 200;
        self.baz = 50000;
        self.qux = 123456789;
    }
}
