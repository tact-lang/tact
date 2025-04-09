struct OptionalDeep {
    inner: Int?;
    boolInner: Bool?;
}

contract OptionalInside {
    nested: OptionalDeep?;

    init() {
        self.nested = null;
    }
}