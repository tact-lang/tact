struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Node {
    leaf: Leaf?;
}

contract OptionalNestedStruct {
    node: Node = Node{ leaf: null };
    init() {}
}