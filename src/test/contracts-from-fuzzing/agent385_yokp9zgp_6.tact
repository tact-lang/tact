struct OptionalNestedStruct {
    nestedOpt: Nested?;
}

struct Nested {
    value: Int;
}

contract OptionalNestedField {
    field: OptionalNestedStruct;

    init() {
        self.field = OptionalNestedStruct{
            nestedOpt: Nested{ value: 42 }
        };
    }
}