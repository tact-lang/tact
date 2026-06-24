struct Leaf { val: Int; }

struct TreeLevel2 {
    left: Leaf;
    right: Leaf;
}

struct TreeLevel1 {
    leftLevel: TreeLevel2;
    rightLevel: TreeLevel2;
}

contract BinaryTree {
    root: TreeLevel1;

    init() {
        self.root = TreeLevel1{
            leftLevel: TreeLevel2{ left: Leaf{ val:1 }, right: Leaf{ val:2 } },
            rightLevel: TreeLevel2{ left: Leaf{ val:3 }, right: Leaf{ val:4 } }
        };
    }
}