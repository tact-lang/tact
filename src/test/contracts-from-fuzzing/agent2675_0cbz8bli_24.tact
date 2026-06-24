struct Leaf {
    iv: Int?;
    bv: Bool?;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node?;
}

contract OptionalTree {
    data: Tree;

    init() {
        self.data = Tree{
            root: Node{
                left: Leaf{},
                right: null
            }
        };
    }
}