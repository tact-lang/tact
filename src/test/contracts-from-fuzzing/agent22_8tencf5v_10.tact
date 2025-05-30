// Deep nesting with contract field being nested within nested structs containing multiple optionals
struct Leaf {
    val: Int?;
}

struct Node {
    leaf: Leaf?;
    flag: Bool?;
}

struct Root {
    node: Node?;
    text: String?;
}

contract NestedOptionalDeep {
    root: Root;

    init() {
        self.root = Root{
            node: null,
            text: null
        };
    }
}