struct Layer1 {
    a: Int;
}

struct Layer2 {
    l1: Layer1;
}

struct Layer3 {
    l2: Layer2;
}

struct Layer4 {
    l3: Layer3;
}

contract Layers {
    lay: Layer4;
    init() {
        self.lay = Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ a: 5 } } } };
    }
}