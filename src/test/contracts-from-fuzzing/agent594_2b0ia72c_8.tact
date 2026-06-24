struct Leaf {
    a: Int? = null;
    b: Bool = true;
}

struct Branch {
    leaf: Leaf;
}

contract Test8 {
    branch: Branch;

    init() {
        self.branch = Branch{
            leaf: Leaf{},
        };
    }

    receive() {}
}