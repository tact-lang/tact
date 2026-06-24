contract Test {
    foo: Int;

    init() {
        self.foo = 42;
    }

    // Attempt to modify state variable in a getter (documented as illegal modification)
    get fun getterWithModification(): Int {
        self.foo = 0; // modification
        return self.foo;
    }
}
