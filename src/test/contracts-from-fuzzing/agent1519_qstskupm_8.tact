struct Leaf {
    num: Int = 5;
}

struct Branch {
    leaf: Leaf;
}

struct Tree {
    branch: Branch;
}

contract OptionDeepTest {
    myTree: Tree? = null;

    init() {
        self.myTree = Tree{branch: Branch{leaf: Leaf{num:42}}};
    }
}