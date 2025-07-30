contract TestGetter {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Getter function that attempts to modify state variable
    get fun getFoo(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
