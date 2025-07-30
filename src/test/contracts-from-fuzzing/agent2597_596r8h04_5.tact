struct DeepNestedOptional {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    flag: Bool;
    text: String?;
}

contract VeryDeep {
    nested: DeepNestedOptional;

    init() {
        self.nested = DeepNestedOptional{
            layer1: Layer1{
                layer2: Layer2{
                    flag: false,
                    text: "deep",
                },
            },
        };
    }
}