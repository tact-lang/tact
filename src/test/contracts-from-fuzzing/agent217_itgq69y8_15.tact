struct Leaf {
    num: Int?;
    flag: Bool;
}

struct Branch {
    leaf: Leaf?;
    label: String?;
}

struct Root {
    branch: Branch?;
    count: Int;
}

contract DeepCombo {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                leaf: null,
                label: null
            },
            count: 42
        };
    }
}