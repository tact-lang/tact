struct Leaf {
    data: Int as uint32 = 55;
    text: String = "leaf";
}

struct Branch {
    left: Leaf? = null;
    right: Leaf?;
    flag: Bool = false;
}

contract ComplexTree {
    root: Branch? = null;
}