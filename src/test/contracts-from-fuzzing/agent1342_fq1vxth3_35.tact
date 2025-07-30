struct Node {
    left: String;
    right: Int;
}

contract Hier {
    field: Node;

    init() {
        self.field = Node{
            left: "L",
            right: 7
        };
    }
}