struct Leaf {
    val: Int = 5;
}

struct Mid {
    l1: Leaf?;
    l2: Leaf = Leaf{};
}

struct Root {
    m1: Mid = Mid{l1: null, l2: Leaf{}};
    m2: Mid?;
}

contract Test10 {
    root: Root = Root{m2: null};
}