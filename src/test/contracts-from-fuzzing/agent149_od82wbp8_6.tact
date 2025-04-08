struct Leaf {
    note: String?;
}

struct Branch {
    label: String;
    leaf: Leaf;
}

contract TestContract {
    b: Branch;

    init() {
        self.b = Branch{
            label: "BranchName",
            leaf: Leaf{
                note: "optional note"
            }
        };
    }
}