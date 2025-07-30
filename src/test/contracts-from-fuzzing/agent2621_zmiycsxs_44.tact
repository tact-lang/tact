// Nested layers with nullable inner structs
struct L3 { x: Int; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract Test {
    data: L1;
    init() {
        self.data = L1{ l2: null };
    }
}