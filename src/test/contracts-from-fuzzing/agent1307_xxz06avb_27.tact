contract NegToUint {
    foo: Int as uint8 = 0;
    init() {
        self.foo = -10;
    }
}