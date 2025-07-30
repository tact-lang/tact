struct Leaf {
    v: Int = 1;
}

struct Mid {
    leaf: Leaf? = null;
}

struct Root {
    mid: Mid? = null;
}

contract TestContract {
    data: Root = Root{};
    receive() {}
}