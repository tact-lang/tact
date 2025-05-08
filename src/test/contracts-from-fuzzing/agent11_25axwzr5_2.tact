contract Test {
    foo: Int;

    init() {
        self.foo = 10;
    }

    // Getter that modifies state in runtime
    get fun changeFoo(): Int {
        self.foo = 100;
        return self.foo;
    }
}
