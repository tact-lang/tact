struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: NestedOptional?;
    label: String;
}

contract OptionalNestedStruct {
    data: Container;
    init() {
        self.data = Container{
            nested: null,
            label: "test"
        };
    }
}