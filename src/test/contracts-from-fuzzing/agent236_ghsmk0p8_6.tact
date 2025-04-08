struct Leaf {
    value: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    child: Branch?;
    flag: Bool;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            child: null,
            flag: false,
        };
    }
}