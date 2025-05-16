struct OptionalLayers {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    layer3: Layer3?;
}

struct Layer3 {
    val: Int?;
}

contract MultiOptionLayer {
    data: OptionalLayers;

    init() {
        self.data = OptionalLayers{
            layer1: null
        };
    }
}