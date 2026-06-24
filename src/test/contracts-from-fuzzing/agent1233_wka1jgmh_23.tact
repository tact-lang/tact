// Test nested optional struct inside another struct
struct Leaf {
    val: Int;
}

struct Node {
    leaf: Leaf?;
}

contract NestedOptionalStructInStorage {
    root: Node;

    init() {
        self.root = Node{leaf: null};
    }
}