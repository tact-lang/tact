struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract Test {
    s: OptionalInner;
    init() {
        self.s = OptionalInner{ a: null, b: true };
    }
}