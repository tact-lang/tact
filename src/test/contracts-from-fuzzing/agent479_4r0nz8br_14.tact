struct Leaf {
    foo: Int;
}

struct Branch {
    child: Leaf?;
}

contract OptNest {
    branch: Branch;

    init() {
        self.branch = Branch{ child: null };
    }
}