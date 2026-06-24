struct L3 {
    x: Int?;
    y: String?;
}

struct L2 {
    l3: L3;
    flag: Bool;
}

struct L1 {
    l2: L2;
    count: Int;
}

contract DeepParams(
    nested: L1,
) {}
