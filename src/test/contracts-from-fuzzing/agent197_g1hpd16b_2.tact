struct Leaf {
    ok: Bool? = null;
}

struct Middle {
    leaf: Leaf;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedOpt {
    nested: Outer = Outer{ middle: Middle{ leaf: Leaf{ ok: null } } };
}