struct Leaf {
    val: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
    label: String;
}

contract TestContract {
    tree: Branch;

    init() {
        self.tree = Branch{
            left: null,
            right: Leaf{ val: 100 },
            label: "X"
        };
    }
}