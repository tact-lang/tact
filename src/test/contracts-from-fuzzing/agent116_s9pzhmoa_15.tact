struct OptionalInner {
    x: Int?;
    y: Bool?;
}

contract OptInnerField {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}