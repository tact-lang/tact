struct Node1 {
    a: Int;
    b: Bool;
}

struct Node2 {
    c: Node1;
    d: Int;
}

struct Node3 {
    e: Node2;
    f: Bool;
}

contract TreeVariant {
    root: Node3;

    init() {
        self.root = Node3{
            e: Node2{
                c: Node1{ a: 1, b: false },
                d: 5
            },
            f: true,
        };
    }

    receive() {
        self.root = Node3{
            e: Node2{
                c: Node1{ a: 2, b: true },
                d: 10
            },
            f: false,
        };
    }
}