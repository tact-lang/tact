// Multiple layers, different optional bools
struct Layer1 { x: Bool?; }
struct Layer2 { l1: Layer1?; }
struct Layer3 { l2: Layer2?; }

contract BoolDeepOpt {
    storage: Layer3;
    init() {
        self.storage = Layer3{
            l2: null,
        };
    }
}