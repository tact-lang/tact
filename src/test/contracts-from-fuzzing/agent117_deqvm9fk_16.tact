struct Leaf {
    x: Int;
    y: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
}

contract TreeContract {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{
                left: Leaf{x: 1, y: 2},
                right: Leaf{x: 3, y: 4}
            }
        };
    }
}
