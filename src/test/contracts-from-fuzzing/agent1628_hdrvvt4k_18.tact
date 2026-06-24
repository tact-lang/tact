// Deeply nested optional struct where some inner optionals are null
struct L3 { v: Int?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TestContract {
    nest: L1?;

    init() {
        self.nest = L1{ l2: L2{ l3: null } };
    }
}