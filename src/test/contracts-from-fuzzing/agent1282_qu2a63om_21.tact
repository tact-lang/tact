struct Leaf { text: String }

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract TwoOptionalStructRefs {
    tree: Branch;

    init() {
        self.tree = Branch{
            left: null,
            right: null,
        };
    }
}
