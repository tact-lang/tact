struct Leaf {
    val: Int;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Trunk {
    branch1: Branch;
    branch2: Branch;
}

contract TreeStorage {
    tree: Trunk;

    init() {
        self.tree = Trunk{
            branch1: Branch{leaf1: Leaf{val:1}, leaf2: Leaf{val:2}},
            branch2: Branch{leaf1: Leaf{val:3}, leaf2: Leaf{val:4}}
        };
    }
}