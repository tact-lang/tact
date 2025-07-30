// Deep optional chains edge case
struct L1 {
    l2: L2?;
}

struct L2 {
    l3: L3?;
}

struct L3 {
    l4: L4?;
}

struct L4 {
    l5: L5?;
}

struct L5 {
    val: Int?;
}

contract OptChain {
    f: L1 = L1 { l2: null };
    init() {}
}
