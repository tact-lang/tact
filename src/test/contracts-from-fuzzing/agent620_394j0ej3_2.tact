contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = myAddress();
    }

    receive() {
        let x: Int = 0;
        if (self.bar) {
            x = 1;
        } else {
            x = 0;
        }
        let _ = self.foo + x;
        let _ = self.baz;
    }
}