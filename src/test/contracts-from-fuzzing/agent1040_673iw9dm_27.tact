struct Leaf {
    a: Int = 1;
    b: Bool? = true;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
    title: String = "default title";
}

contract TestContract {
    tree: Branch;

    init() {
        self.tree = Branch{
            l1: Leaf{ a: 10, b: null },
            l2: Leaf{ a: 20 },
            title: "custom"
        };
    }
}