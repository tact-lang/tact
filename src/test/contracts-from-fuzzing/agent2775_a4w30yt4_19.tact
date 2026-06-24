struct OptionalLeaf {
    v: Int?;
}

struct Branch {
    l: OptionalLeaf;
    r: OptionalLeaf;
}

contract OptionalBranch {
    b: Branch;

    init() {
        self.b = Branch{
            l: OptionalLeaf{ v: null },
            r: OptionalLeaf{ v: 42 }
        };
    }
}