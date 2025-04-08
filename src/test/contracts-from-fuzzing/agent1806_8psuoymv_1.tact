struct Inner {
    nestedInt: Int;
    nestedBool: Bool;
    nestedAddress: Address;
}

contract TestNested {
    nested: Inner;
    init() {
        self.nested = Inner{
            nestedInt: 42,
            nestedBool: true,
            nestedAddress: myAddress(),
        };
    }
}