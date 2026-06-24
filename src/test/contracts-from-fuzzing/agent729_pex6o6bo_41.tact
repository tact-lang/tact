contract NullableAddress {
    foo: Address?;
    bar: Address;
    init() {
        self.foo = null;
        self.bar = myAddress();
    }
    receive() {}
}