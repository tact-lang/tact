struct L3 { x: Int; }
struct L2 { z: L3; }
struct L1 { y: L2; }

contract DeepNested3 {
    data: L1;
    init() {
        self.data = L1{ y: L2{ z: L3{ x: 123 } } };
    }
}