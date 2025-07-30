contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Address;

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = "hello";
        self.qux = myAddress();
    }
}