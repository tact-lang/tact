contract TestContract {
    foo: Int = 1;

    init() {
        self.foo = 42;
    }

    receive() {
        self.foo = 100;
    }
}
