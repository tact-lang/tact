struct Leaf {
    val: Int;
    note: String?;
}

struct Branch {
    wrapped: Leaf?;
    flag: Bool?;
}

struct Root {
    branchOpt: Branch?;
    label: String;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            branchOpt: Branch{
                wrapped: null,
                flag: null,
            },
            label: "root",
        };
    }
}