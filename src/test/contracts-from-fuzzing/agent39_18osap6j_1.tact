contract TestGet {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that performs a modification on state variable foo
    get fun modifyGetter(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}

// A minimal main to trigger contract deployment (not necessary for compiling)
