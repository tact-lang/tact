struct Leaf {
    a: Int;
    b: Int;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Tree {
    b1: Branch;
    b2: Branch;
}

contract TreeLike {
    root: Tree;

    init() {
        self.root = Tree{
            b1: Branch{
                l1: Leaf{ a: 1, b: 2 },
                l2: Leaf{ a: 3, b: 4 },
            },
            b2: Branch{
                l1: Leaf{ a: 5, b: 6 },
                l2: Leaf{ a: 7, b: 8 },
            }
        };
    }
}