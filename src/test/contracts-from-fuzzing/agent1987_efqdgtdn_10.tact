struct Layer3 {
    i: Int;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer1 {
    layer2: Layer2;
}

contract NestedLayers {
    data: Layer1;
    init() {
        self.data = Layer1{
            layer2: Layer2{
                layer3: Layer3{i: 42}
            }
        };
    }
}