struct Leaf {
    val: Int = 0;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    info: String = "";
}

contract BinaryTreeStore {
    theTree: Tree;

    init() {
        self.theTree = Tree{
            root: Branch{
                left: Leaf{val: 1},
                right: Leaf{val: 2}
            },
            info: "hello"
        };
    }
}
