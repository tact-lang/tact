struct Leaf {
    v: Int? = 4;
}

struct Branch {
    leaf: Leaf?;
}

contract ForceNullDeep {
    data: Branch = Branch{
        leaf: null
    };
}