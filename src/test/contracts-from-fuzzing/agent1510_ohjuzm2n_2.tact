contract TestContract {
    foo: Int = 0;
    bar: Bool = false;
    baz: Address? = null;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = null;
    }

    receive() {
        let _ = self.foo;
        let _ = self.bar;
        let _ = self.baz;
    }
}