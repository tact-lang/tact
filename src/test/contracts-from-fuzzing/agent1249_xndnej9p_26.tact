struct OptInner {
    s: String?;
}

contract OptInnerField {
    innerOpt: OptInner?;

    init() {
        self.innerOpt = null;
    }
}