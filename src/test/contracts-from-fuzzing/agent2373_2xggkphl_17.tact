struct OptionalNested {
    nested: Nested?;
}

struct Nested {
    x: Int;
}

contract OptionalNestedStruct {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{ nested: null };
    }
}