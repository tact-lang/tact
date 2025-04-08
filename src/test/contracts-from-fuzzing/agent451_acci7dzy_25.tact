struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    layer4: Layer4;
}

struct Layer4 {
    value: Int;
}

contract NestedLayers {
    data: Layer1;

    init() {
        self.data = Layer1{ layer2: Layer2{ layer3: Layer3{ layer4: Layer4{value: 42} } } };
    }
}