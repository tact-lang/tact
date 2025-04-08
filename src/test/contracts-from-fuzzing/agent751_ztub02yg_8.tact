struct Leaf {
    foo: Int? = null;
    bar: Bool? = null;
}

struct Branch {
    leaf: Leaf;
    label: String;
}

contract OptionalDefaultsNested {
    tree: Branch;

    init() {
        self.tree = Branch{
            leaf: Leaf{},
            label: "root"
        };
    }
}