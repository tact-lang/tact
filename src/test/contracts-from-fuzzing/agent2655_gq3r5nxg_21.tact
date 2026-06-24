struct Leaf {
    a: Int;
    b: Bool;
}

struct Node {
    left: Leaf;
    right: Leaf?;
    flag: Bool;
}

contract NodeTree {
    root: Node;

    init() {
        self.root = Node{
            left: Leaf{a:1,b:true},
            right: null,
            flag: false,
        };
    }
}