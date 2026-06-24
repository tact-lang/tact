struct Leaf {
    x: Int?;
}

struct Branch {
    leaf: Leaf?;
    y: String?;
}

contract AllNullNested {
    nest: Branch?;

    init() {
        self.nest = Branch{
            leaf: null,
            y: null,
        };
    }
}
