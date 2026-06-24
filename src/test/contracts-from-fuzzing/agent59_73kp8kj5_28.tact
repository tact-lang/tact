struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract OptionalTreeStorage {
    tree: Tree? = null;
}
