struct Leaf {
    x: Int as uint32;
    y: Bool;
}

struct Node {
    child: Leaf;
    note: String;
}

contract InitAssign {
    data: Node;

    init() {
        self.data = Node{
            child: Leaf{
                x: 123,
                y: true
            },
            note: "assigned via init"
        };
    }
}