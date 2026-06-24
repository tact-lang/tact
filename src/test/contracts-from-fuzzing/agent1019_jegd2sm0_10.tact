struct Leaf {
    val: Int?;
}

struct Node {
    leaf: Leaf?;
}

struct Root {
    node: Node?;
}

contract TestContract {
    root: Root = Root{};

    init() {} 
}