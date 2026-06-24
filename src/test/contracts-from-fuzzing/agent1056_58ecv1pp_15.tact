struct LeafX {
    q: Int;
    w: Bool?;
}

struct Branch {
    l: LeafX;
    note: String;
}

struct RootOptional {
    left: Branch?;
    right: Branch?;
}

contract PartiallyNullNested {
    tree: RootOptional;

    init() {
        self.tree = RootOptional{
            left: Branch{
                l: LeafX{ q: 9, w: null },
                note: "left"
            },
            right: null,  // right subtree is missing
        };
    }
}