struct Leaf {
    leafVal: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Node;
}

contract TreeStore {
    main: Tree;

    init() {
        self.main = Tree{
            root: Node{
                left: Leaf{leafVal: 10},
                right: Leaf{leafVal: 20},
            }
        };
    }
}