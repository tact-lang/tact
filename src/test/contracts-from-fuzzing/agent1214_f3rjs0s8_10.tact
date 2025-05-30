struct OptionalLayers {
    layer1: Int?;
    layer2: Bool?;
    layer3: String?;
}

contract DeepOptionals {
    layers: OptionalLayers;
    init() {
        self.layers = OptionalLayers{
            layer1: null,
            layer2: null,
            layer3: null
        };
    }
}