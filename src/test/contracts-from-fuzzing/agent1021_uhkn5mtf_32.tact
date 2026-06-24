// param type with optional chain nested inside param
struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract ParamOptChain(
    root: Top?,
) {}