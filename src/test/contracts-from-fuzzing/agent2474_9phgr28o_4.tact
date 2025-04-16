struct Leaf {
    x: Int?;
    y: Bool?;
    label: String;
}

struct Branch {
    left: Leaf;
    right: Leaf?;
}

contract DeepNestedOptionals {
    root: Branch;

    init() {
        self.root = Branch{
            left: Leaf{
                x: 1,
                y: true,
                label: "left branch",
            },
            right: null,
        };
    }
}
