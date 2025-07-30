struct OptionalInner {
    val: Int?;
}

contract OptionalInPersistence {
    opt_inner: OptionalInner?;
    init() {
        self.opt_inner = null;
    }
}