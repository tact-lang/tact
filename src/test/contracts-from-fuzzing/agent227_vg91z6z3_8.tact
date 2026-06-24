struct Leaf {
    score: Int = 7;
    comment: String?; // default null
}

struct Branch {
    name: String;
    leaf: Leaf;
}

contract NestedDefaults {
    tree: Branch;

    init() {
        self.tree = Branch{
            name: "root",
            leaf: Leaf{}, // uses default score=7, comment=null
        };
    }

    receive() {
        let _ = self.tree.leaf.comment;
    }
}
