struct OptionalInner {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    optionalInner: OptionalInner?;

    init() {
        self.optionalInner = null;
    }
}