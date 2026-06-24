struct NestedOptionalFields {
    innerInt: Int?;
    innerBool: Bool?;
}

contract OptionalStructFields {
    val: NestedOptionalFields;

    init() {
        self.val = NestedOptionalFields{
            innerInt: null,
            innerBool: null,
        };
    }
}