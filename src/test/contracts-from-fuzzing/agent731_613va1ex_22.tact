struct MultiLayer {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    layer4: Layer4;
}

struct Layer4 {
    flag: Bool = true;
    str: String = "deep";
}

contract NestedLayers {
    data: MultiLayer;

    init() {
        self.data = MultiLayer{ layer2: Layer2{ layer3: Layer3{ layer4: Layer4{} } } };
    }
}