struct OptionalInner {
    v: Int?;
}

contract OptionalWrap {
    w: OptionalInner?;

    init() {
        self.w = null;
    }
}