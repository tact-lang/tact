struct Leaf {
    q: Int = 999;
    r: Bool? = null;
}

struct Branch {
    s: String = "hello";
    leaf: Leaf = Leaf{};
}

struct Root {
    id: Int = 1;
    branch: Branch = Branch{};
}

contract MultiNestDefault {
    data: Root = Root{};
}