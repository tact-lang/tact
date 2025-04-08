struct OptionalDeep {
    nested: Int?;
}

struct Container {
    field1: OptionalDeep?;
    field2: OptionalDeep?;
}

contract OptionalNestedStruct {
    holder: Container;
    init() {
        self.holder = Container{
            field1: null,
            field2: OptionalDeep{ nested: 42 }
        };
    }
}