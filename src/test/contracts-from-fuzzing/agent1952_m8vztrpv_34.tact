struct OptionalNestedStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract TestContract {
    ons: OptionalNestedStruct;

    init() {
        self.ons = OptionalNestedStruct{
            nested: InnerStruct{
                x: 42,
                y: null,
            },
        };
    }
}
