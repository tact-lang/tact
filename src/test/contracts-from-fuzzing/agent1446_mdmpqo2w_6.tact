contract Test {
    foo: Int;
    bar: Bool = true;
    baz: String = "test";
    qux: Address;

    init() {
        self.foo = 42;
        self.qux = myAddress();
    }
}
