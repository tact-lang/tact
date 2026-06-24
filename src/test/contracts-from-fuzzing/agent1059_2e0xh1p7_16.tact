contract TestContract {
    foo: Int;

    init() {
        self.foo = 0;
    }

    get fun read(): Int {
        return self.foo;
    }

    receive() {
        self.foo = 42;
    }
}