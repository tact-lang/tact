struct DeepNested {
    layer1: String?;
    layer2: String?;
    layer3: String?;
    layer4: String?;
    layer5: String?;
}

contract ManyOptionalStrings {
    d: DeepNested;

    init() {
        self.d = DeepNested{
            layer1: null, layer2: null, layer3: "X", layer4: null, layer5: null
        };
    }
}
