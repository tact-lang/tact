struct Leaf {
    x: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    leftBranch: Branch;
    rightBranch: Branch;
}

contract BinTree {
    root: Root;

    init() {
        self.root = Root{
            leftBranch: Branch{left: Leaf{x:1}, right: Leaf{x:2}},
            rightBranch: Branch{left: Leaf{x:3}, right: Leaf{x:4}}
        };
    }
}