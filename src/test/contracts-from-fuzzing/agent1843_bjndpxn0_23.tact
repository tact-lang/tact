struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    leftBranch: Branch;
    rightBranch: Branch;
}

contract BinaryTreeContract {
    root: Root;

    init() {
        self.root = Root{
            leftBranch: Branch{
                left: Leaf{val:1},
                right: Leaf{val:2}},
            rightBranch: Branch{
                left: Leaf{val:3},
                right: Leaf{val:4}}
        };
    }
}
