struct OptInner {
    val: Int?;
}

contract OptionalFieldNested {
    nested: OptInner?;

    init() {
        self.nested = null;
    }
}