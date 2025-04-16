struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf;
}

contract PartialExplicit {
    tree: Branch = Branch{
        leaf: Leaf{val: 555}
    };

    init() {}
}