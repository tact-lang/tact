struct Leaf {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

struct Branch {
    l1: Leaf = Leaf{};
    l2: Leaf = Leaf{};
}

struct Root {
    b1: Branch = Branch{};
    b2: Branch = Branch{};
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{};
    }
}
