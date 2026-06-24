contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address; // remove invalid default initializer

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = myAddress();
    }

    receive() {
        let _ = self.foo + 1;
    }
}