struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

contract NestedNestedParam(
    tree: Branch
) {}