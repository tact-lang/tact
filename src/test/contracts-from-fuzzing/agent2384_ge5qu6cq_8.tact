struct NestedOptionalField {
    x: Int?;
    y: Bool;
}

contract InitWithNestedOpt {
    data: NestedOptionalField;

    init() {
        self.data = NestedOptionalField{
            x: null,
            y: false,
        };
    }
}