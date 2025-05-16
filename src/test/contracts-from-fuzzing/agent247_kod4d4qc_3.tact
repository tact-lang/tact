struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
}

contract OptionalNested {
    inner: Inner?;
    init() {
        self.inner = Inner{
            a: 5,
            b: true,
            c: "opt",
            d: myAddress(),
            e: null,
        };
    }
}