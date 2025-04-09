contract Test {
    foo: Int as uint8; // small uint
    bar: Int as int16; // small int

    init() {
        self.foo = 42;
        self.bar = -10;
    }
}