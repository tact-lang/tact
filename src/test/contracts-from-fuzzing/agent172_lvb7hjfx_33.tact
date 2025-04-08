contract Test {
    foo: Int;

    init() {
        self.foo = 1;
    }

    get fun f(): Int {
        return self.foo;
    }
}