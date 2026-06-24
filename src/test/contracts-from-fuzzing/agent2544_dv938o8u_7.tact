struct OptionalNestedStruct {
    nested: DeepNested?;
}

struct DeepNested {
    value: Int;
}

contract TestOptNested {
    inner: OptionalNestedStruct;
    init() {
        self.inner = OptionalNestedStruct{
            nested: null
        };
    }
}