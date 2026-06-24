struct OptionalNestedStruct {
    x: Int;
    y: Bool;
}

contract OptionalNestedField {
    nestedOpt: OptionalNestedStruct?;

    init() {
        self.nestedOpt = null;
    }
}
