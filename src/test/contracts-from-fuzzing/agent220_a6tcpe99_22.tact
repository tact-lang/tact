struct Leaf {
    v: Int = 7;
}

struct Branch {
    leaf: Leaf;
    label: String?;
}

struct Root {
    branch: Branch;
    flag: Bool = true;
}

contract NestedLayers {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                leaf: Leaf{v: 42},
                label: "deep"
            },
            flag: false
        };
    }

    receive() {}
}