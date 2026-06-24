struct Nested {
    value: Int?;
    label: String;
}

struct Container {
    nested: Nested;
    description: String;
}

contract OptionalInsideNestedStruct {
    state: Container;

    init() {
        self.state = Container{
            nested: Nested{ value: null, label: "label" },
            description: "desc"
        };
    }
}