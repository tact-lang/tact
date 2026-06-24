struct OptionalNested {
    s: String?;
    b: Bool;
}

contract NullInNestedStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{ s: null, b: true };
    }
}
