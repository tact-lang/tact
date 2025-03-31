contract TestGetter {
    foo: Int;

    init() {
        self.foo = 123;
    }

    get fun modify(): Int {
        self.foo = 456;
        return self.foo;
    }
}
