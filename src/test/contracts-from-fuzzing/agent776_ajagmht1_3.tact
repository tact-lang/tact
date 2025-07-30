struct OptionalInner {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptStructTest {
    inner: OptionalInner;
    init() {
        self.inner = OptionalInner{
            a: null,
            b: null,
            s: null
        };
    }
}
