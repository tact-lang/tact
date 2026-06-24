struct OptionalDeepWrap {
    wrapped: Int;
}

contract OptionalStructPersistence {
    opt: OptionalDeepWrap?;

    init() {
        self.opt = null;
    }
}