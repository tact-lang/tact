struct OptionalStruct {
    nested: Int?;
}

contract OptionalInside {
    s: OptionalStruct?;
    init() {
        self.s = null;
    }
}