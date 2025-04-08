struct Leaf {
    lval: Int?;
}

struct Branch {
    bval: Leaf;
}

struct Tree {
    tval: Branch;
}

contract Forest {
    forestTree: Tree;

    init() {
        self.forestTree = Tree{
            tval: Branch{
                bval: Leaf{ lval: 123 }
            }
        };
    }
}