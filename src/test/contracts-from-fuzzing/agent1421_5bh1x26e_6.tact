struct Leaf {
    m: Bool?;
    n: String?;
}

struct Branch {
    leaf: Leaf;
}

contract NestedOptionalStructs {
    branch: Branch;

    init() {
        self.branch = Branch{ leaf: Leaf{ m: null, n: null } };
    }
}