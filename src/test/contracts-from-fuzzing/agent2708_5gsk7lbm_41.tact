struct DeepOptionalInner {
    x: Int?;
    y: Int?;
}

contract OptionalStruct {
    nested: DeepOptionalInner?;

    init() {
        self.nested = null;
    }
}