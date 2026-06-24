struct Layer4 {
    l4: Int;
}

struct Layer3 {
    l3: Layer4;
}

struct Layer2 {
    l2: Layer3;
}

struct Layer1 {
    l1: Layer2;
}

contract FourLayer {
    nested: Layer1;

    init() {
        self.nested = Layer1{ l1: Layer2{ l2: Layer3{ l3: Layer4{ l4: 123 } } } };
    }
}