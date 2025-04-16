struct Leaf {
    leafVal: String;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Leaf;
    branch: Branch;
}

contract TreeStructTest {
    t: Tree;

    init() {
        self.t = Tree{
            root: Leaf{ leafVal: "root" },
            branch: Branch{
                left: Leaf{ leafVal: "left" },
                right: Leaf{ leafVal: "right" },
            }
        };
    }
}
