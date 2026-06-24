// optional at root, deeply nested through multiple levels of optional structs
struct Leaf { x: Int }
struct Node2 { leaf: Leaf?; }
struct Node1 { node: Node2?; }
struct Root { n: Node1?; }

contract DeepNull {
    data: Root?;
    init() {
        self.data = null;
    }
}