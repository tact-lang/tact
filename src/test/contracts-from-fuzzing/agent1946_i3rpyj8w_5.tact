struct Leaf {
    foo: Int = 1;
    bar: Bool = true;
}

struct Node {
    leaf: Leaf = Leaf{};
}

struct Root {
    node: Node = Node{};
}

contract Test {
    root: Root = Root{};
}
