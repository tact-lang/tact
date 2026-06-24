struct Leaf {
    x: Int = 7;
    y: String? = "leaf";
}

struct Branch {
    leaf: Leaf = Leaf{};
    name: String = "branch";
}

struct Root {
    branch: Branch = Branch{};
    flag: Bool = true;
}

contract Test {
    data: Root;

    init() {
        self.data = Root{};
    }
}