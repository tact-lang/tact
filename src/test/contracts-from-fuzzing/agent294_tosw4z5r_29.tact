struct Leaf {
    text: String = "L";
    opt: Int? = null;
}

struct Branch {
    l1: Leaf = Leaf{};
    l2: Leaf;
    optLeaf: Leaf? = null;
}

contract StressMix {
    br: Branch;

    init() {
        self.br = Branch{
            l2: Leaf{}
        };
    }
}
