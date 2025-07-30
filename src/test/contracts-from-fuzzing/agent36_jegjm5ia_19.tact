struct Leaf {
    x: Int = 1234;
}

struct Mid {
    leaf: Leaf;
}

contract ImplicitNestedDefaultsFixed {
    mid: Mid = Mid{
        leaf: Leaf{}
    };
}