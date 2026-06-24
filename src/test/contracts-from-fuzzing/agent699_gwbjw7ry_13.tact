struct Leaf {
    a: Int;
    b: Bool = false;
}

struct Node {
    left: Leaf;
    right: Leaf;
    flag: Bool;
}

struct Root {
    n1: Node;
    n2: Node;
    globalFlag: Bool = true;
}

contract MixDefaults {
    root: Root;

    init() {
        self.root = Root{
            n1: Node{ left: Leaf{a:1}, right: Leaf{a:2}, flag: true },
            n2: Node{ left: Leaf{a:3}, right: Leaf{a:4}, flag: false }
        };
    }
}
