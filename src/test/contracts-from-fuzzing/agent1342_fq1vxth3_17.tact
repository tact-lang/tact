struct Leaf {
    s: String;
}

struct Branch {
    leaf: Leaf;
}

struct Root {
    branch: Branch;
}

contract Tree {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                leaf: Leaf{ s: "val" }
            }
        };
    }
}