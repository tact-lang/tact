contract TestContract {
    foo: Int = 0;
    bar: Bool = false;
    baz: Address;

    init() {
        self.baz = myAddress();
    }

    receive() {
        // To ensure init is compiled, keep it minimal
    }
}