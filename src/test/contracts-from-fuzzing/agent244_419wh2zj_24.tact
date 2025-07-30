// deeply nested struct chain mix with optionals
struct Node4 {
    v: Int?;
}

struct Node3 {
    n: Node4?;
}

struct Node2 {
    n: Node3?;
}

struct Node1 {
    n: Node2?;
}

contract NullChain {
    data: Node1;

    init() {
        self.data = Node1{
            n: null
        };
    }
}