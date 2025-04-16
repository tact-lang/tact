contract TestState {
    foo: Int;

    init() {
        self.foo = 10;
    }

    // Getter that tries to modify state
    get fun updateGetter(): Int {
        self.foo = 20;
        return self.foo;
    }
}

// A receiver to trigger execution of the getter
// actually getter is exported off-chain so just testing compilation