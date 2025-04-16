// optional struct containing optional struct containing optional struct
struct L3 { s: String?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TripleOpt {
    data: L1;
    init() {
        self.data = L1{ l2: null };
    }
}
