struct Leaf {
    a: Int?;
    b: Bool;
}

struct Branch {
    inner: Leaf?;
}

struct Root {
    branch: Branch;
}

contract DeepOpt {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                inner: null
            }
        };
    }
}