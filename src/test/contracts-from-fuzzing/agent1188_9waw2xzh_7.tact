struct Leaf {
    a: Int;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract WideNestedTree {
    data: Root;

    init() {
        self.data = Root{
            branch1: Branch{leaf1: Leaf{a: 1}, leaf2: Leaf{a: 2}},
            branch2: Branch{leaf1: Leaf{a: 3}, leaf2: Leaf{a: 4}},
        };
    }
}