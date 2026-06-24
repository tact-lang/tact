struct Layer1 { n: Int; }
struct Layer2 { l1: Layer1; }
struct Layer3 { l2: Layer2; }
struct Layer4 { l3: Layer3; }

contract Deep4LayerStorage {
    data: Layer4;
    init() {
        self.data = Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ n: 7 } } } };
    }
}