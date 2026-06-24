struct OptionalInner {
    a: Int;
}

contract OptionalField {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}