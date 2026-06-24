struct Leaf {
    value: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract BinaryTreeTest {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Branch{
                left: Leaf{ value: 7 },
                right: null
            }
        };
    }
}