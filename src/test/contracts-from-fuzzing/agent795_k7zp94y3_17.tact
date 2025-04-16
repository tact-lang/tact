struct Leaf {
    a: Int = 1;
    b: String?;
}

struct Mid {
    leaf: Leaf = Leaf{};
    num: Int?;
}

struct Root {
    m1: Mid = Mid{};
    m2: Mid?;
}

contract Test {
    complex: Root = Root{};
}