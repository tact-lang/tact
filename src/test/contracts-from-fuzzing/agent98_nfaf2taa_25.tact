struct Deep {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    val: Int;
}

contract DeepLayers {
    data: Deep;

    init() {
        self.data = Deep{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{ val: 42 }
                }
            }
        };
    }
}