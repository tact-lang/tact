struct Layer3 { v: Int; }
struct Layer2 { l3: Layer3; }
struct Layer1 { l2: Layer2; }

contract NestedDepth {
    d: Layer1;
    init() {
        self.d = Layer1{ l2: Layer2{ l3: Layer3{ v: 42 } } };
    }
}