struct Leaf {
    val: Int = 42;
}

struct Middle {
    leaf: Leaf? = null;
}

contract NestedDefaultOpt {
    m: Middle = Middle{};
}
