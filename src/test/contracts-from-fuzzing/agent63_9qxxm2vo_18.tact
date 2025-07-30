struct Leaf {
    x: Int = 99;
}

struct Branch {
    leaf: Leaf = Leaf{};
}

struct Trunk {
    branch: Branch = Branch{};
}

contract Tree {
    data: Trunk;

    init() {
        self.data = Trunk{};
    }
}