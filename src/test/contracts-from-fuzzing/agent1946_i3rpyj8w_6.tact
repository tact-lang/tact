struct Leaf {
    foo: Int?;
    bar: Bool?;
}

struct Node {
    leaf: Leaf;
}

struct Root {
    node: Node = Node{ leaf: Leaf{} };
}

contract Test {
    root: Root = Root{};
}
