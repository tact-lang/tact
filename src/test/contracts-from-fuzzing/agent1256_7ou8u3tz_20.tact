struct Leaf {
    val: Int;
}

struct Node {
    leaf: Leaf?;
}

contract NestedOptionStructs {
    data: Node?;

    init() {
        self.data = null;
    }
}