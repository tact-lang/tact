contract TestContract {
    foo: Int;

    init() {
        self.foo = 42;
    }

    receive() {
        self.foo = 10;
    }

    get fun fooCopy(): Int {
        return self.foo;
    }
}