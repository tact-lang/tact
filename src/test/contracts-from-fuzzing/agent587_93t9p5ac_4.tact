struct MultiLayerNested {
    layer1: LayerOne;
}

struct LayerOne {
    layer2: LayerTwo;
}

struct LayerTwo {
    layer3: LayerThree;
}

struct LayerThree {
    x: Int;
    y: Bool;
    z: Bool?;
}

contract DeepLayers {
    tree: MultiLayerNested;

    init() {
        self.tree = MultiLayerNested{
            layer1: LayerOne{
                layer2: LayerTwo{
                    layer3: LayerThree{
                        x: 7,
                        y: true,
                        z: null
                    }
                }
            }
        };
    }
}