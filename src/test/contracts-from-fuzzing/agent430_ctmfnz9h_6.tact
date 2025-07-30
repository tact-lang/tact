struct Leaf {
    k: Int;
}

struct Node {
    leaf: Leaf;
    maybeLeaf: Leaf?;
}

contract Test {
    root: Node = Node {
        leaf: Leaf{ k: 1 },
        maybeLeaf: null
    };
}