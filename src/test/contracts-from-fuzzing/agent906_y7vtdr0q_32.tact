struct OptionalNestedStruct {
    payload: Int;
}

contract OptionalNested {
    nested: OptionalNestedStruct?;

    init() {
        self.nested = null;
    }
}