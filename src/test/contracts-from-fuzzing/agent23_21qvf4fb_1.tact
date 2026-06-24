contract GetterTest {
    foo: Int;

    init() {
        self.foo = 0;
    }

    // Getter function that modifies state variable
    get fun increment(): Int {
        self.foo = self.foo + 1;
        return self.foo;
    }
}
