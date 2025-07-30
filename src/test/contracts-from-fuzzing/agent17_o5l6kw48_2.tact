contract TestGetterModify {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that attempts to modify state
    get fun modifyGetter(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
