struct OptionalInner {
    v: Bool?;
}

contract OptStructInContract {
    s: OptionalInner?;

    init() {
        self.s = null;
    }
}