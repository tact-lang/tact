struct OptionalNestedStruct {
    val: Int;
}

struct HasOptionalNested {
    nested: OptionalNestedStruct?;
}

contract OptionalNestedField {
    data: HasOptionalNested;

    init() {
        self.data = HasOptionalNested{ nested: null };
    }
}
