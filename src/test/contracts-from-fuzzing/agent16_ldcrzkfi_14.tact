struct Leaf {
    n: Int;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Trunk {
    b1: Branch;
    b2: Branch;
}

struct Tree {
    t1: Trunk;
    t2: Trunk;
}

contract TreeContract {
    bigTree: Tree;

    init() {
        self.bigTree = Tree{
            t1: Trunk{
                b1: Branch{ l1: Leaf{n:1}, l2: Leaf{n:2} },
                b2: Branch{ l1: Leaf{n:3}, l2: Leaf{n:4} }
            },
            t2: Trunk{
                b1: Branch{ l1: Leaf{n:5}, l2: Leaf{n:6} },
                b2: Branch{ l1: Leaf{n:7}, l2: Leaf{n:8} }
            }
        };
    }
}