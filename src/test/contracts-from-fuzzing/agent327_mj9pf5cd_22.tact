struct Leaf {
    x: Int;
}

struct Branch {
    leaf: Leaf? = null;
}

contract OptBranch {
    rec: Branch;

    init() {
        self.rec = Branch{};
    }
}
