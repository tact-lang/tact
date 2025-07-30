struct OptionalStringStruct {
    label: String?;
    comment: String?;
}

contract NestedOptionalString {
    metadata: OptionalStringStruct;

    init() {
        self.metadata = OptionalStringStruct{
            label: null,
            comment: "sample"
        };
    }
}