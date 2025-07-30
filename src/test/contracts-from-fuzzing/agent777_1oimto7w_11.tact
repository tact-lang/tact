struct NestedOptionalString {
    desc: String?;
}

contract OptionalStringStorage {
    optField: NestedOptionalString?;

    init() {
        self.optField = NestedOptionalString{
            desc: null,
        };
    }
}