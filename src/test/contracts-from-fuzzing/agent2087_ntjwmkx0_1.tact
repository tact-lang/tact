struct OptionalNested {
    innerField: Int?;
}

contract OptionalNestedStorage {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{innerField: null};
    }
}