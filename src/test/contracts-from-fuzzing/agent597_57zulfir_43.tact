struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

contract TreeStorage {
    tree: Branch;
    init() {
        self.tree = Branch{
            left: Leaf{ val:1 },
            right: Leaf{ val:2 }
        };
    }
}