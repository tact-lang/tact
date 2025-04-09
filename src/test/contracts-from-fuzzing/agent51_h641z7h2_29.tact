struct Layer3 {
    x: Int = 1;
}

struct Layer2 {
    l3a: Layer3;
    l3b: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract Test {
    l1: Layer1;
    init() {
        self.l1 = Layer1{ l2: Layer2{ l3a: Layer3{}, l3b: Layer3{} } };
    }
}