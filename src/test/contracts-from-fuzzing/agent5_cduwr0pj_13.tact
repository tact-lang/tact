struct Leaf {
    x: Int;
    y: Bool;
}

struct Branch {
    leaf: Leaf;
}

struct Root {
    branch: Branch;
}

contract PartialInit {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                leaf: Leaf{
                    x: 99,
                    y: false
                }
            }
        };
    }
}
