struct DeepOptional {
    layer1: Int?;
    layer2: Int?;
    layer3: Int?;
    layer4: Int?;
    layer5: Int?;
}

contract DeepOptionalContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            layer1: null,
            layer2: null,
            layer3: null,
            layer4: null,
            layer5: null,
        };
    }
}