struct OptionalInside {
    foo: Int?;
}

contract OptionalInnerField {
    nested: OptionalInside;

    init() {
        self.nested = OptionalInside{ foo: null };
    }
}