// deeply nested optional structs with many nulls
struct Leaf { val: Int; }
struct Node1 { val: Leaf?; }
struct Node2 { val: Node1?; }
struct Node3 { val: Node2?; }

contract Test {
    root: Node3;

    init() {
        self.root = Node3{ val: null };
    }
}