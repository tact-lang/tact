/// Test Getter 1: A valid getter that only reads state variable
contract TestGetterRead {
    bar: Int;

    init() {
        self.bar = 42;
    }

    get fun getBar(): Int {
        return self.bar;
    }
}

/// Test Getter 2: A getter that intentionally modifies the state variable
// According to documentation, getters should not modify state variables, but empirical tests show that modifications do not persist post-execution.
// This test compiles successfully, confirming the documented nuance.
contract TestGetterModification {
    foo: Int;

    init() {
        self.foo = 0;
    }

    get fun getFoo(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
