contract TestContract {
    foo: Int;
    bar: Bool;
    addr: Address;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
    }
}