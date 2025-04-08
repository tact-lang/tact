struct OptionalNested {
    val: Int?;
    text: String?;
}

contract OptionalNestedStruct {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested {
            val: null,
            text: null
        };
    }
}
