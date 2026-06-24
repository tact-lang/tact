struct InnerStruct {
    foo: Int;
}

struct Container {
    nested: InnerStruct?;
}

contract OptionalNestedStruct {
    value: Container;

    init() {
        self.value = Container{
            nested: InnerStruct{ foo: 42 }
        };
    }
}