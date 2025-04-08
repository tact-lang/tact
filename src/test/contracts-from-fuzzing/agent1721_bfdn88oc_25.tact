// deeply nested optionals, mixing optional structs and optionals of primitives
struct Leaf { val: Int?; }
struct Node { leaf: Leaf?; }
struct Root { node: Node?; }

contract NestedOptionalsMix {
    data: Root;
    init() {
        self.data = Root { node: null };
    }
}
