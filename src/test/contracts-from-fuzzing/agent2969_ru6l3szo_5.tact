struct Leaf {
    x: Int;
}

struct Node {
    leaf: Leaf;
    flag: Bool;
}

contract Test {
    data: Node = Node{leaf: Leaf{x: 42}, flag: false};
}