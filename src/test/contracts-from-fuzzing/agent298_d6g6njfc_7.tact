struct L1 { x: Int = 1; }
struct L2 { x: L1 = L1{}; }
struct L3 { x: L2 = L2{}; }
struct L4 { x: L3 = L3{}; }
struct L5 { x: L4 = L4{}; }

contract DeepNest {
    x: L5 = L5{};
}
