struct Leaf {
    x: Int;
}

struct Branch {
    leafA: Leaf?;
    leafB: Leaf?;
}

contract OptionalNestedLeaves {
    branch: Branch;

    init() {
        self.branch = Branch{
            leafA: null,
            leafB: null
        };
    }
}