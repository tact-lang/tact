contract EmptyDefaults {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;

    init() {
        self.foo = 10;
        self.bar = true;
        self.baz = "hello";
        self.addr = myAddress();
    }
}
