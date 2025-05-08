struct Tree {
    left: Leaf?;
    right: Leaf?;
}

struct Leaf {
    val: Int;
}

contract Test {
    root: Tree;

    init() {
        self.root = Tree{
            left: Leaf{val:1},
            right: null
        };
    }
}