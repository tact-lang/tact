struct Leaf {
    v: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch;
}

contract OptionalTree {
    data: Tree;
    init() {
        self.data = Tree{
            root: Branch{
                left: null,
                right: Leaf{ v: 123 }
            }
        };
    }
}