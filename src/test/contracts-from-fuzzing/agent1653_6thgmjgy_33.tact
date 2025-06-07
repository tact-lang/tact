struct L5 {
    deepVal: Int;
}

struct L4 {
    ll5: L5?;     // optional of optional if L5 was optional, but just 1-level opt here
    b: Bool?;
}

struct L3 {
    ll4: L4?;
    msg: String?;
}

struct L2 {
    ll3: L3?;
    txt: String?;
}

contract TestContract(
    deep: L2?
) {
}