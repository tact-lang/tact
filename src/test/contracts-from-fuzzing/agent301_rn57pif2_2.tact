contract TestContract {
    foo: Int = -42;
    bar: Bool = true;
    baz: Address;

    init() {
        self.baz = myAddress();
    }

    receive() {
        let _ = self.foo + 1;
    }
}