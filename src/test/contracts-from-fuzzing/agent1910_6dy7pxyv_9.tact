struct Leaf {
    leafval: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    trunk: Branch;
    flag: Bool;
}

contract TreeStorage {
    t: Tree;

    init() {
        self.t = Tree{
            trunk: Branch{
                left: Leaf{ leafval: 123 },
                right: Leaf{ leafval: 456 }
            },
            flag: true
        };
    }
}
