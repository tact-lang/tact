struct Leaf {
    v: Int? = 4;
}

struct Branch {
    leaf: Leaf;
}

contract InitDeepOpt {
    data: Branch = Branch{
        leaf: Leaf{v:5}
    };
}