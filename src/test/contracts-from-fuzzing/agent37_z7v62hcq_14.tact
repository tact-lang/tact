struct Leaf {
    x: Int;
}

struct Node1 {
    n1: Leaf?;
}

struct Node2 {
    n2: Node1?;
}

struct Node3 {
    n3: Node2?;
}

contract Test {
    root: Node3;
    init() {
        self.root = Node3{
            n3: null
        };
    }
}