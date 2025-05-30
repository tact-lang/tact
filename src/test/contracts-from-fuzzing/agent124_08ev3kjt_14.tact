// A struct with a deeply nested optional
struct L1 { o: Int?; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }

contract DeepOptionalStruct {
    stuff: L3;
    init() {
        self.stuff = L3{ l2: L2{ l1: L1{ o: null } } };
    }
}