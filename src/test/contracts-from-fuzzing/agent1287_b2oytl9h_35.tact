struct L1 { val: Int as uint4 = 1; }
struct L2 { l1: L1 = L1{}; }
struct L3 { l2: L2 = L2{}; }
struct L4 { l3: L3 = L3{}; }
struct L5 { l4: L4 = L4{}; }

contract FiveDeepSerialized {
    deep: L5 = L5{};
}