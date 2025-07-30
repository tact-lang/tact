contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "test";
        self.addr = myAddress();
    }
}