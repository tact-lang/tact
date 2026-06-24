struct OptInner {
    val: Int?;
    text: String?;
}

contract OptionalStructOptVars {
    nested: OptInner?;

    init() {
        self.nested = null;
    }
}