contract NegativeUintDefault {
    foo: Int as uint8 = -1;

    init() {
        self.foo = 5;
    }
}