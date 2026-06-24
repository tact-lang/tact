struct Deep {
    layer1: Int?;
    layer2: Int?;
    layer3: Int?;
    layer4: Int?;
    layer5: Int?;
    layer6: Int?;
    layer7: Int?;
    layer8: Int?;
}

contract DeepOptionals {
    d: Deep;

    init() {
        self.d = Deep{
            layer1: null, layer2: null, layer3: null, layer4: null,
            layer5: null, layer6: null, layer7: null, layer8: null
        };
    }
}