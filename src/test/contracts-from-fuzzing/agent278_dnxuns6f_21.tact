struct Layer3 {
    val: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract Chain3Layers {
    data: Layer1;
    init() {
        self.data = Layer1{ l2: Layer2{ l3: Layer3{ val: 99 } } };
    }
}