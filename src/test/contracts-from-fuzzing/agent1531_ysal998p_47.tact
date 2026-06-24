contract ManyInts {
    foo: Int as int8;
    bar: Int as uint8;
    baz: Int as int16;
    qux: Int as uint16;
    quux: Int as int32;
    corge: Int as uint32;

    init() {
        self.foo = 10;
        self.bar = 20;
        self.baz = 30;
        self.qux = 40;
        self.quux = 50;
        self.corge = 60;
    }
}
