struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 1,
            b: true,
            c: myAddress(),
        };
    }
}
