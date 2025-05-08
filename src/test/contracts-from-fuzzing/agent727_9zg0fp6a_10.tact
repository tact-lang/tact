struct DeepDive {
    layer1: Int;
    layer2: Int?;
    layer3: Int;
    layer4: Int?;
    layer5: Int;
    layer6: Int?;
    layer7: Int;
    layer8: Int?;
}

contract AlternatingOptionals {
    deep: DeepDive;

    init() {
        self.deep = DeepDive{
            layer1: 1,
            layer2: null,
            layer3: 3,
            layer4: null,
            layer5: 5,
            layer6: null,
            layer7: 7,
            layer8: null
        };
    }
}