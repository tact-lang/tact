struct Leaf {
    z: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract DeepOptionalNest {
    root: Root;
    init() {
        self.root = Root{
            branch: Branch{
                leaf: null
            }
        };
    }
}