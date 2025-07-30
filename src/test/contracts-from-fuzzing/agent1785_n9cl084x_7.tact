struct OptionalNested {
    value: Int?;
    text: String?;
    boolField: Bool;
}

contract OptionalNestedStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            value: null,
            text: null,
            boolField: true,
        };
    }
}