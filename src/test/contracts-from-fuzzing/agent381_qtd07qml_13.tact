struct MixedInner {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract TestContract {
    inner: MixedInner;
    init() {
        self.inner = MixedInner{
            a: 42,
            b: null,
            c: "hello",
            d: null
        };
    }
}
