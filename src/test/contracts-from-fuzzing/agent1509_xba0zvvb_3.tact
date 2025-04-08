contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = myAddress();
    }

    receive() {
        let _ = self.foo + ((self.bar) ? 1 : 0);
        let __ = self.baz;
    }
}