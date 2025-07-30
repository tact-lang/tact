struct Leaf {
    val: Int;
}

struct Node {
    child: Leaf?;
    count: Int;
}

contract OptionalNestedNull {
    data: Node;

    init() {
        self.data = Node{
            child: null,
            count: 555,
        };
    }
}
