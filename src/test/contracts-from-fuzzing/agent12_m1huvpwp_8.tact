struct Leaf {
    val: Int;
}

struct BranchA {
    x: Leaf;
    y: Leaf;
}

struct BranchB {
    m: Leaf;
    n: Leaf;
}

struct Tree {
    left: BranchA;
    right: BranchB;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            left: BranchA{
                x: Leaf{val: 1},
                y: Leaf{val: 2},
            },
            right: BranchB{
                m: Leaf{val: 3},
                n: Leaf{val: 4},
            }
        };
    }
}