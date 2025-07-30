contract TestContract {
    foo: Int = 0;
    bar: Bool = true;
    baz: String = "hello";
    addr: Address;

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = "world";
        self.addr = myAddress();
    }

    receive() {
        let x = self.foo + (self.bar ? 1 : 0);
        let y = self.baz;
        let z = self.addr;
    }
}