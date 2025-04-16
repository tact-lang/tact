struct Leaf {
    a: Int? = null;
    b: Bool? = null;
}

struct Node {
    left: Leaf? = null;
    right: Leaf? = null;
}

struct Root {
    one: Node? = null;
    two: Node? = null;
}

contract MaxOptComplex {
    root: Root;

    init() {
        self.root = Root{
            one: Node{ left: null, right: Leaf{ a: 1, b: null } },
            two: null
        };
    }

    receive() {
        let _ = self.root;
    }
}