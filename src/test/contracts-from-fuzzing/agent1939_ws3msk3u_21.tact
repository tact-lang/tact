struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    inner: OptionalInner?;
    init() {
        self.inner = OptionalInner{ a: null, b: true };
    }
}