struct Leaf {
    lx: Int = 5;
    ly: Bool? = null;
}

struct Mid {
    mval: Leaf;
    mopt: Int? = null;
}

struct Root {
    rval: Mid;
    ropt: String? = "rootopt";
}

contract PartialNest {
    root: Root = Root{
        rval: Mid{
            mval: Leaf{},
        },
    };
    init() {}
}