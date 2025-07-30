contract Test {
    foo: Int as uint4;

    init() {
        self.foo = 1;
        self.foo = 2;
        self.foo = 20; // Out of range but allowed during init()
        self.foo = 5;
    }
}