contract TestGetterModification {
    foo: Int;

    init() {
        self.foo = 1;
    }

    // Getter function that attempts to modify the state variable
    get fun modifyGetter(): Int {
        // According to documentation, this should not be allowed to change state
        self.foo = self.foo + 1;
        return self.foo;
    }

    // A normal function to read the current state
    get fun readFoo(): Int {
        return self.foo;
    }
}
