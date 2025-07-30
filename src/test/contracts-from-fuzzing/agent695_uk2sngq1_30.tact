struct Node {
    id: Int;
    next: Int?;
}

contract ListStyle {
    n1: Node;
    n2: Node;
    n3: Node;

    init() {
        self.n1 = Node{id:1,next:2};
        self.n2 = Node{id:2,next:3};
        self.n3 = Node{id:3,next:null};
    }
}