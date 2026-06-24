struct Leaf {
    val: Int?;
}

struct Adjunct {
    leaf: Leaf?;
}

struct Subtree {
    adj: Adjunct?;
}

struct Tree {
    sub: Subtree?;
}

contract Forest {
    root: Tree?;
}