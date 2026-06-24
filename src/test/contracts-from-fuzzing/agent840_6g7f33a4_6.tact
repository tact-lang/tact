struct Leaf {
    a: Int?;
}

struct Mid {
    leaf: Leaf;
}

struct Root {
    mid: Mid;
}

contract ParamNested(
    val: Root,
) {}
