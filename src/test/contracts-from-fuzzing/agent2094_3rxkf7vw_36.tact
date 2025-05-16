struct Leaf {
    v: Int = 5;
}

struct Middle {
    leaf: Leaf? = null;
}

contract NestedOptionNull {
    mid: Middle = Middle{};
    receive() {}
}
