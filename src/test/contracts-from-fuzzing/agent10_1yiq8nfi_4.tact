contract ModifyGetter {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that modifies state variable
    get fun modify(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
