struct Layer3 {
    value: Int;
}

struct Layer2 {
    field: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract DeepThreeLayerStorage {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            nested: Layer2{
                field: Layer3{
                    value: 42,
                },
            },
        };
    }
}
