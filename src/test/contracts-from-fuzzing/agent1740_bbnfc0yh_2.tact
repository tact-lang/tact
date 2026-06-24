contract Test {
    foo: Int = 1;
    bar: Bool = true;
    baz: Address;

    init() {
        self.foo = 2;
        self.bar = false;
        self.baz = myAddress();
    }
}