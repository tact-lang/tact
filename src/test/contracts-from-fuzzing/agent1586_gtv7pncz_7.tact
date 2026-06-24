struct Leaf {
    a: Int;
    b: Bool;
}

struct Middle1 {
    x: Leaf;
}

struct Middle2 {
    y: Leaf;
}

struct Root {
    one: Middle1;
    two: Middle2;
}

contract TreeStorage {
    root: Root;

    init() {
        self.root = Root {
            one: Middle1 { x: Leaf { a: 1, b: true } },
            two: Middle2 { y: Leaf { a: 2, b: false } }
        };
    }
}