struct Leaf {
    value: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalNested {
    optBranch: Branch?;

    init() {
        self.optBranch = Branch{
            left: Leaf{ value: 1 },
            right: null,
        };
    }
}