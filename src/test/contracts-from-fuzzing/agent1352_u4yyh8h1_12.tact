struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf;
}

struct Trunk {
    branch: Branch;
}

contract TestContract {
    tree: Trunk;

    init() {
        self.tree = Trunk{ branch: Branch{ leaf: Leaf{ val: null } } };
    }
}
