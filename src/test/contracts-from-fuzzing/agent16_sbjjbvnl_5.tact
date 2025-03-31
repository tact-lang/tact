contract TestGetter {
    foo: Int;

    init() {
        self.foo = 100;
    }

    // Getter function that attempts to modify the contract's state variable.
    // Documentation claims getters cannot modify state variables, but in practice such modifications don't persist.
    get fun modifyGetter(): Int {
        self.foo = 200;
        return self.foo;
    }
}
