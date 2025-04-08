contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    qux: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.qux = "hello";
    }
}