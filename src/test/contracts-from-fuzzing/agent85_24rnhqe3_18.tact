struct DeeplyNestedOptional {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    layer3: Layer3?;
}

struct Layer3 {
    value: Int;
}

contract DeepOpt {
    nest: DeeplyNestedOptional;
    init() {
        self.nest = DeeplyNestedOptional{ layer1: null };
    }
}