struct OptionalNested {
    maybeInt: Int?;
    maybeStruct: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            maybeInt: null,
            maybeStruct: null
        };
    }
}