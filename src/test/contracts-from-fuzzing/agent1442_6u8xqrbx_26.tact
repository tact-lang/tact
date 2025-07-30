// fuzz multi-level nested structs + optionals + defaults
struct L3 { x: Int? = null; }
struct L2 { x: Int = 5; l3: L3 = L3{}; }
struct L1 { l2: L2; y: Bool = true; }

contract TestContract {
    root: L1;
    init() {
        self.root = L1{l2: L2{}};
    }
}