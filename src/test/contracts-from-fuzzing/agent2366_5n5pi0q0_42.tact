struct Leaf {
    val: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Parent {
    n: Node;
}

contract TreeTest {
    root: Parent;

    init() {
        self.root = Parent{n:Node{left:Leaf{val:1},right:Leaf{val:2}}};
    }
}