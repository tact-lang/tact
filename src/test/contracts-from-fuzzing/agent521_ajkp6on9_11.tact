struct Leaf {
    f1: Int;
    f2: String;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract TreeStruct {
    root: Node;

    init() {
        self.root = Node{
            left: Leaf{
                f1: 10,
                f2: "left",
            },
            right: null,
        };
    }
}