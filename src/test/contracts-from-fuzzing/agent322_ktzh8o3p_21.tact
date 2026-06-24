struct Leaf { n: Int; }
struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    top: Node;
    bottom: Node;
}

contract TreeShape {
    t: Tree = Tree{
        top: Node{ left: Leaf{n:1}, right: Leaf{n:2} },
        bottom: Node{ left: Leaf{n:3}, right: Leaf{n:4} }
    };
}