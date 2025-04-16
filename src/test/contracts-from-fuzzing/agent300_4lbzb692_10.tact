struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Mid {
    l1: Leaf;
    l2: Leaf?;
}

struct Top {
    m: Mid?;
}

contract Test {
    val: Top = Top { m: null };
}