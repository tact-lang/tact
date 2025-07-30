struct Leaf {
    val: Int;
}

struct Node {
    child: Leaf?;
}

contract StructWithNullField {
    field: Node;

    init() {
        self.field = Node{
            child: null
        };
    }
}