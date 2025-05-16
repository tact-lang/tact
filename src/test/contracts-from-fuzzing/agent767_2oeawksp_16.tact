struct OptionalInner {
    d: Int?;
    e: Bool?;
}

contract ComboOptionalInside {
    inner: OptionalInner?;

    init() {
        self.inner = null;
    }
}