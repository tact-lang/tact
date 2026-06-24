struct Layer1 {
    val1: Int;
}
struct Layer2 {
    layer1: Layer1;
}
struct Layer3 {
    layer2: Layer2;
}
struct Layer4 {
    layer3: Layer3;
}
struct Layer5 {
    layer4: Layer4;
}

contract ManyLayers {
    data: Layer5;

    init() {
        self.data = Layer5{
            layer4: Layer4{
                layer3: Layer3{
                    layer2: Layer2{
                        layer1: Layer1{
                            val1: 1234,
                        },
                    },
                },
            },
        };
    }
}
