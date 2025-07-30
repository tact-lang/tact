contract Test {
    foo: Int as uint8;
    init() {
        self.foo = -5;
        self.foo = 1000;
        self.foo = 200;
    }
}