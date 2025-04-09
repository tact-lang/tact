struct Leaf {
    x: Int;
    s: String?;
}

struct Node {
    l1: Leaf;
    optLeaf: Leaf?;
    flag: Bool;
}

contract ComplexOpt {
    data: Node?;

    init() {
        self.data = Node{
            l1: Leaf{ x: 1, s: null },
            optLeaf: Leaf{ x: 2, s: "deep" },
            flag: true
        };
    }
}