struct OptionalNestedStruct {
    inner: InnerOptional?;
}

struct InnerOptional {
    value: Int;
    flag: Bool;
}

contract OptionalNested {
    nestedField: OptionalNestedStruct;

    init() {
        self.nestedField = OptionalNestedStruct{
            inner: null
        };
    }
}