struct OptionalInner {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    stored: OptionalInner?;

    init() {
        self.stored = null;
    }
}