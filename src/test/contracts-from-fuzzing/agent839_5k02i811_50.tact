struct Node {
    value: Int;
    next: Int?;
}

contract FlatLinkedList {
    head: Node;
    init() {
        self.head = Node{value:1,next:null};
    }
}