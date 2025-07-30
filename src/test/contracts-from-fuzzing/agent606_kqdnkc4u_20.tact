struct Node {
    key: Int as uint32;
    value: String?;
}

struct Tree {
    root: Node?;
}

contract Test {
    tree: Tree = Tree{ root: null };
}