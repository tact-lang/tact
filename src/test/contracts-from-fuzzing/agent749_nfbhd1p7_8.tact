struct DeeplyNested {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    layer4: Layer4;
}

struct Layer4 {
    value: Int;
}

contract TestContract {
    root: DeeplyNested;

    init() {
        self.root = DeeplyNested{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        layer4: Layer4{
                            value: 999,
                        },
                    },
                },
            },
        };
    }

    receive() {
        let _ = self.root.layer1.layer2.layer3.layer4.value;
    }
}