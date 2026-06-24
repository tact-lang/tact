struct Leaf {
    val: Int = 1;
}

struct Node {
    leaf: Leaf? = null;
}

struct Tree {
    node: Node? = null;
}

contract NestedOptionalOptionals {
    tree: Tree = Tree{};
}