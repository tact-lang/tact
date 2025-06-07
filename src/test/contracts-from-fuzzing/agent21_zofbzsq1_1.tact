contract HelloWorld {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Standard getter function that only reads the state
    get fun getFoo(): Int {
        return self.foo;
    }
}
