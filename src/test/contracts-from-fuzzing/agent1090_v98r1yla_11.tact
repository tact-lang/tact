struct OptionalInner {
    inner: Int?;
}

contract OptionalInStruct {
    s: OptionalInner?;

    init() {
        self.s = null;
    }
}