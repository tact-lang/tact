struct Leaf {
    a: Int;
    b: Bool;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract TreeStruct {
    root: Node;

    init() {
        self.root = Node{
            left: Leaf{a:4,b:true},
            right: null,
        };
    }
}
