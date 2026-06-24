struct Leaf {
    val: Int;
    flag: Bool?;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Tree {
    branch1: Branch;
    branch2: Branch;
}

contract NestedTree {
    data: Tree;

    init() {
        self.data = Tree{
            branch1: Branch{
                l1: Leaf{ val: 1, flag: null },
                l2: Leaf{ val: 2, flag: true },
            },
            branch2: Branch{
                l1: Leaf{ val: 3, flag: null },
                l2: Leaf{ val: 4, flag: false },
            }
        };
    }
}