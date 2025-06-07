contract TestContract {
    foo: Int;

    init() {
        self.foo = 42;
    }

    receive() {
        self.foo = self.foo + 1;
    }
}