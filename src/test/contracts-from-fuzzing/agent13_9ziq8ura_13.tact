struct Layer1 { f1: Int?; f2: Bool?; }
struct Layer2 { l1: Layer1?; }
struct Layer3 { l2: Layer2?; }

contract DeepTower {
    val: Layer3;

    init() {
        self.val = Layer3{ l2: Layer2{ l1: Layer1{ f1: null, f2: null } } };
    }
}