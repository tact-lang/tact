struct Node {
    data: Int;
    next: Int?; 
}

contract LinkedListTest {
    node: Node;

    init() {
        self.node = Node{data: 42, next: null};
    }
}