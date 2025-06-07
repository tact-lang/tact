struct OptionalNested {
    level: Int;
    maybeNested: NestedStruct?;
}

struct NestedStruct {
    value: Int;
}

contract OptionalInNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            level: 1,
            maybeNested: NestedStruct{
                value: 55
            }
        };
    }
}