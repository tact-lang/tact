struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract OptionalNested {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{
            a: null,
            b: true
        };
    }
}