// Edge: Many nested structs, deeply, all fields optional and initially null
struct L0 { val: Int?; }
struct L1 { l0: L0?; }
struct L2 { l1: L1?; }
struct L3 { l2: L2?; }
struct L4 { l3: L3?; }

contract DeepNull {
    root: L4;
    init() {
        self.root = L4{ l3: null };
    }
}
