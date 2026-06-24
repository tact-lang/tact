struct L4 { val: Int; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }
contract DeepNull {
    deeply: L1 = L1{};
    init() {}
}