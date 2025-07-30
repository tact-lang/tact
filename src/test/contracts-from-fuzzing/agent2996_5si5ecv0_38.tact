contract OutOfRangeFinal {
    foo: Int as uint8;

    init() {
        self.foo = -10;   // invalid
        self.foo = 512;   // invalid final assigned
    }
}