struct Leaf {
    text: String;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

contract TwoOptionStruct {
    root: Node;

    init() {
        self.root = Node{
            left: null,
            right: Leaf{ text: "hi" },
        };
    }
}
