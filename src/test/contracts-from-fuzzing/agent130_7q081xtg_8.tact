// Contract field with deeply nested struct, some fields optional
struct Leaf {
    score: Int?;
}

struct Branch {
    comment: String = "";
    leaf: Leaf;
}

struct Tree {
    depth: Int = 0;
    left: Branch;
    right: Branch;
}

contract TestContract {
    t: Tree;

    init() {
        self.t = Tree{
            depth: 1,
            left: Branch{ comment: "L", leaf: Leaf{ score: 10 } },
            right: Branch{ comment: "R", leaf: Leaf{ score: null } }
        };
    }

    receive() {
        self.t = self.t;
    }
}