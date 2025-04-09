contract ConstOutOfRange {
    // uint8 can only serialize up to 255
    foo: Int as uint8 = 300;

    init() {
        // reassign in-range
        self.foo = 100;
    }
}