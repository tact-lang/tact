struct OptionalNested {
    val: Int;
    nested: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract OptionalNestedStruct {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{val: 7, nested: null};
    }
}