// Compose very deep nested structs with optional and non-optional leaf
struct Leaf {
    id: Int;
    name: String?;
}

struct Node4 {
    leaf: Leaf?;
}

struct Node3 {
    child: Node4?;
}

struct Node2 {
    child: Node3?;
}

struct Node1 {
    child: Node2?;
}

contract TestContract {
    root: Node1;

    init() {
        self.root = Node1{ child: null };
    }
}