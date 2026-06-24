struct OptionalDeepNest {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
    x: Int;
}

struct Layer2 {
    y: Int;
    note: String?;
}

contract NestedOptionalStorage {
    data: OptionalDeepNest;

    init() {
        self.data = OptionalDeepNest{
            layer1: Layer1{
                x: 7,
                layer2: Layer2{
                    y: 9,
                    note: null,
                },
            },
        };
    }
}