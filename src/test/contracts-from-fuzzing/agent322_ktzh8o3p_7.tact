struct L4 { v4: Int = 4; }
struct L3 { l4: L4 = L4{}; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract PartialAssign {
    state: L1 = L1{ l2: L2{ l3: L3{} } };
}