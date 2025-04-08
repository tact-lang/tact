// Large nested struct, with optional composite inside
struct Leaf {
    id: Int;
    active: Bool?;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf?;
    desc: String;
}

struct Tree {
    left: Branch;
    right: Branch;
    note: String?;
}

contract TestContract {
    forest: Tree;

    init() {
        self.forest = Tree{
            left: Branch{ leaf1: Leaf{ id: 1, active: true }, leaf2: null, desc: "L" },
            right: Branch{ leaf1: Leaf{ id: 2, active: false }, leaf2: null, desc: "R" },
            note: null,
        };
    }
}
