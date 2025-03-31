contract TestGetter {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that modifies the state variable
    get fun changeFoo(): Int {
        self.foo = 42;
        return self.foo;
    }
}
