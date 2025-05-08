struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    side: Branch;
}

contract TreeContract {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{
                left: Leaf{val: 1},
                right: Leaf{val: 2}
            },
            side: Branch{
                left: Leaf{val: 3},
                right: Leaf{val: 4}
            }
        };
    }
}