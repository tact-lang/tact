struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract NestedContract {
    nested: Inner;
    intField: Int;

    init() {
        self.nested = Inner{a: 10, b: true, c: myAddress()};
        self.intField = 1;
    }
}
