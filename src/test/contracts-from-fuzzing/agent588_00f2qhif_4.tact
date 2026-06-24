// Test a contract with a deep nested struct chain
struct L3 { z: Int }
struct L2 { y: L3 }
struct L1 { x: L2 }

contract DeepNest {
    data: L1;
    init() {
        self.data = L1{ x: L2{ y: L3{ z: 999 } } };
    }
}