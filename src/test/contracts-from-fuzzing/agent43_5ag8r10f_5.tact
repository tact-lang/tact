struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalNestedStruct {
    tree: Branch?;

    init() {
        self.tree = Branch{
            left: Leaf{ x: 1, y: null },
            right: null
        };
    }
}