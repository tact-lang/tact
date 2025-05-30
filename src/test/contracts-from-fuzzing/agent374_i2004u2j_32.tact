// Deep nesting with params styles
struct Leaf {
    foo: Int;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

contract ParamTree(
    root: Node
) {
    receive() {
        let _ = self.root.left.foo;
    }
}