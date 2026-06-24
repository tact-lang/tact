struct ManyLayers {
    layer1: Int;
    layer2: Int?;
    layer3: String?;
    layer4: Bool?;
    layer5: Address?;
}

contract MultiOptionalContainer {
    val: ManyLayers;

    init() {
        self.val = ManyLayers{
            layer1: 1,
            layer2: null,
            layer3: null,
            layer4: null,
            layer5: null
        };
    }
}
