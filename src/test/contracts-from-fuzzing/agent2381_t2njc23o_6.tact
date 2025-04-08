struct Leaf {
    x: Int = 42;
}

struct Branch {
    leaf: Leaf? = null;
    note: String = "hi";
}

struct Tree {
    b: Branch? = null;
    label: String = "root";
}

contract TestContract {
    t: Tree = Tree{};

    init() {}
}