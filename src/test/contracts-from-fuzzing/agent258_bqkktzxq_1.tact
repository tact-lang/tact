contract TestContract {
    foo: Int = 1;
    bar: Bool = false;
    baz: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.foo = 42;
        self.bar = true;
        self.baz = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
}