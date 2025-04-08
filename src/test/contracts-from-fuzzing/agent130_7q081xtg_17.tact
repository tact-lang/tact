// Nested structs with multiple optional fields inside
struct Leaf {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Node {
    l1: Leaf?;
    l2: Leaf?;
}

struct Root {
    n1: Node?;
    n2: Node?;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            n1: Node{ l1: Leaf{ a: null, b: null, c: null }, l2: null },
            n2: null
        };
    }

    receive() {
        self.data = self.data;
    }
}