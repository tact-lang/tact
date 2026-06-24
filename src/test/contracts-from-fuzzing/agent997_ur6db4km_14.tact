struct Leaf {
    value: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract TestContract {
    branch: Branch;

    init() {
        self.branch = Branch{};
    }
}