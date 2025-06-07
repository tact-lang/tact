struct Leaf1 {
    x: Int;
}

struct Leaf2 {
    y: Bool;
}

struct Branch {
    l1: Leaf1? = null;
    l2: Leaf2? = null;
}

contract TestContract {
    b: Branch = Branch{};

    init() {}
}