struct Node {
    child: Int?;
    data: Int;
}

contract OptionalFirstTest {
    head: Node;
    
    init() {
        self.head = Node { child: null, data: 42 };
    }
}