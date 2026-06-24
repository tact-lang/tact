struct Node {
    id: Int;
    next: Cell;
    data: String;
}

contract NodeChain {
    head: Node;

    init() {
        self.head = Node{
            id:1,
            next: emptyCell(),
            data: "First"
        };
    }
}