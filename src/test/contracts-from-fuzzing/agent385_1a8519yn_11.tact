struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract OptionalChain {
    tree: Tree?;

    init() {
        self.tree = Tree{
            branch: Branch{
                leaf: Leaf{
                    val: 42
                }
            }
        };
    }
}
