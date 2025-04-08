contract SerialOrder {
    foo: Int as uint8;
    bar: Int;
    baz: Int as int16;

    init() {
        self.foo = 255;
        self.bar = -5;
        self.baz = -100;
    }
}