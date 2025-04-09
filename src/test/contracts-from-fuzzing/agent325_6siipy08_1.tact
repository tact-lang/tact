contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "abc";
        self.qux = myAddress();
    }
}