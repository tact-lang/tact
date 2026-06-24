struct L3 {
    val: Int?;
    flag: Bool?;
}

struct L2 {
    inner: L3?;
    name: String?;
}

struct L1 {
    nested: L2?;
    count: Int?;
}

contract DeepParamChain(
    config: L1?
) {}