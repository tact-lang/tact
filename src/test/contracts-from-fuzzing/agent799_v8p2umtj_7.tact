struct OptionalNested {
    foo: Int;
    nested: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    y: Bool;
}

contract OptionalInnerStruct {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            foo: 1,
            nested: NestedStruct{x: 2, y: true}
        };
    }
}