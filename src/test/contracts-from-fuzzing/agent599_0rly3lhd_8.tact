struct Leaf {
    z: Int?;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
}

contract TestContract {
    data: Tree;

    init() {
        self.data = Tree{
            root: Branch{
                left: Leaf{z: null},
                right: Leaf{z: 100}
            }
        };
    }
}