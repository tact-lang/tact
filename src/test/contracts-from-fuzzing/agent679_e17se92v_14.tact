struct Leaf {
    value: Int as uint16;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
}

contract TreeTest {
    data: Tree = Tree{
        root: Node{
            left: Leaf{value: 1},
            right: Leaf{value: 2}
        }
    };
}