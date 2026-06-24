struct Leaf {
    v: Int as uint8;
}

struct Branch {
    leaf: Leaf?;
    tag: String;
}

struct Root {
    branch: Branch?;
    label: String;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            branch: Branch{
                leaf: Leaf{ v: 42 },
                tag: "branch",
            },
            label: "root"
        };
    }
}
