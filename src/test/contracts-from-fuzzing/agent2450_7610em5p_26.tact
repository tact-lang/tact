// deeply nested struct chain --> optional --> struct
struct Leaf {
    a: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract ChainNestingOptional {
    root: Tree;

    init() {
        self.root = Tree{
            branch: Branch{
                leaf: Leaf{ a: 10 }
            }
        };
    }
}
