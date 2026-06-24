struct Inner {
    a: Int;
    b: Bool?;
    c: Address;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 5,
            b: null,
            c: myAddress(),
        };
    }
}
