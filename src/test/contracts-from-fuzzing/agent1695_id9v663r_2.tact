struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
}

contract Test2 {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 5,
            b: false,
            c: myAddress(),
            d: null
        };
    }
}
