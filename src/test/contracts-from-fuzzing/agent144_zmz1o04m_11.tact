struct Leaf {
    x: Int?;
    y: String?;
}

struct Branch {
    leaf: Leaf?;
    flag: Bool?;
}

contract NullNestAll {
    root: Branch?;

    init() {
        self.root = Branch{
            leaf: Leaf{
                x: null,
                y: null
            },
            flag: null
        };
    }
}