struct Mid {
    zz: Bool;
    deep: Leaf;
}

struct Leaf {
    leafField: Int?;
}

contract OptionalNestedChain(
    mid: Mid?,
    ready: Bool,
    txt: String,
) {
}