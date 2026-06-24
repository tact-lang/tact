struct Leaf {
    d: Int?;
}

struct Node {
    c: Leaf?;
}

struct Branch {
    b: Node;
}

contract Tree {
    root: Branch;
    init() {
        self.root = Branch{
            b: Node{
                c: null,
            },
        };
    }
}
