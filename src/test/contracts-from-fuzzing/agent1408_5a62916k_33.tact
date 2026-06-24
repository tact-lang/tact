struct ManyLayersNested {
    layer0: Int;
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
    opt3: Layer3?;
}

struct Layer3 {
    field: Int;
}

contract TestContract {
    data: ManyLayersNested;

    init() {
        self.data = ManyLayersNested{
            layer0: 1,
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{field: 2},
                    opt3: null,
                },
            },
        };
    }
}