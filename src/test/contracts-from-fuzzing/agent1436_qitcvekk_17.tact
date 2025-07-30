struct OptionalLayer {
    layer1: Int?;
    layer2: Int?;
    layer3: Int?;
    layer4: Int?;
    layer5: Int?;
}

contract TestContract {
    optLayers: OptionalLayer;

    init() {
        self.optLayers = OptionalLayer{
            layer1: null, layer2: 2, layer3: null, layer4: 4, layer5: null
        };
    }
}