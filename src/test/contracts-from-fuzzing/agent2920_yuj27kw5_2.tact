struct Layer3 {
    x: Int;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract NestedStructs {
    storage: Layer1;

    init() {
        self.storage = Layer1{ l2: Layer2{ l3: Layer3{ x: 5 } } };
    }
}