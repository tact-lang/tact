struct OptionalNested {
    field: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract TestOptNestedStruct {
    nested: OptionalNested;
    init() {
        self.nested = OptionalNested{ field: null };
    }
}