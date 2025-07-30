struct Layer3 {
    val: Int;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer1 {
    layer2: Layer2;
}

contract ThreeLayersDeep {
    root: Layer1;

    init() {
        self.root = Layer1{ layer2: Layer2{ layer3: Layer3{ val: 123 } } };
    }
}