struct DeepNestLayer4 {
    val: Int;
    flag: Bool?;
}

struct DeepNestLayer3 {
    layer4: DeepNestLayer4;
}

struct DeepNestLayer2 {
    layer3: DeepNestLayer3?;
}

struct DeepNestLayer1 {
    layer2: DeepNestLayer2;
}

contract DeeplyNestedContract {
    data: DeepNestLayer1;

    init() {
        self.data = DeepNestLayer1{
            layer2: DeepNestLayer2{
                layer3: DeepNestLayer3{
                    layer4: DeepNestLayer4{
                        val: 42,
                        flag: null,
                    },
                },
            },
        };
    }
}
