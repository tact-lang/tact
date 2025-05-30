contract TestGetter {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Getter function that only reads state variable
    get fun getFoo(): Int {
        return self.foo;
    }
}
