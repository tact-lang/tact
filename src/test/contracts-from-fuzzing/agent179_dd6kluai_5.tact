struct Leaf {
    flag: Bool? = true;
}

struct Branch {
    leaf: Leaf = Leaf{};
}

struct Tree {
    branch: Branch = Branch{};
}

contract TestContract {
    state: Tree = Tree{};
}