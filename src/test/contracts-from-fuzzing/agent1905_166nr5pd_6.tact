struct DeepNested {
    nested: NestedStruct;
}

struct NestedStruct {
    nestedAgain: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract DeepChainStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nested: NestedStruct{
                nestedAgain: InnerMost{
                    value: 999,
                },
            },
        };
    }
}