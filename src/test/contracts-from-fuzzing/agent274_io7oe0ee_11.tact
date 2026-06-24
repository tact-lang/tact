struct DeeplyLayered {
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
    flag: Bool;
    message: String;
}

contract ManyLayers {
    data: DeeplyLayered;

    init() {
        self.data = DeeplyLayered{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        layer4: Layer4{
                            flag: true,
                            message: "Deep",
                        },
                    },
                },
            },
        };
    }

    receive() {}
}
