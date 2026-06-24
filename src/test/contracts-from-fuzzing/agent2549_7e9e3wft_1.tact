struct DeepNested {
    layer1: Int;
    layer2: Nested;
}

struct Nested {
    value1: Bool;
    value2: String;
}

contract TestDeepNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            layer1: 1,
            layer2: Nested{
                value1: false,
                value2: "xyz",
            },
        };
    }
}