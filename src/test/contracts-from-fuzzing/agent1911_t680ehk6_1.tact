struct DeeplyNested {
    layer: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    value: Int;
    label: String;
}

contract TestCtrl {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            layer: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        value: 123,
                        label: "deep test"
                    }
                }
            }
        };
    }
}