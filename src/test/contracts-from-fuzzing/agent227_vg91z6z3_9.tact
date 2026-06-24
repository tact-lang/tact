struct Leaf {
    n: Int;
}

struct Branch {
    leaf: Leaf?;
    label: String;
}

contract OptionalStructField {
    branch: Branch;

    init() {
        self.branch = Branch{
            leaf: null,
            label: "x",
        };
    }

    receive() {
        let _ = self.branch.leaf;
    }
}
