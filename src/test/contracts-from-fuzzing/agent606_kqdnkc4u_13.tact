struct Leaf { val: Int; }
struct Node { leaf: Leaf?; }
struct Root { node: Node; }

contract Test {
    r: Root = Root{ node: Node{ leaf: null } };
}