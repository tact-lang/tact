struct Leaf {
    id: Int as uint8;
    note: String?;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract OptionalChain {
    nested: Tree;

    init() {
        self.nested = Tree{
            root: null
        };
    }
}