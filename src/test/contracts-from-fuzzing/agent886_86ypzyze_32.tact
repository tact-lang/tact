struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Branch {
    leaf: Leaf?;
    info: String?;
}

struct Root {
    branch: Branch?;
    label: String;
}

contract TestContract {
    rootVal: Root;
    init() {
        self.rootVal = Root{
            branch: Branch{
                leaf: null,
                info: null
            },
            label: "root"
        };
    }
}