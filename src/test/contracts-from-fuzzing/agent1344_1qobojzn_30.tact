struct Node {
    left: Int?;
    right: Int?;
    parent: Int?;
}

contract OptionalMany {
    node: Node;

    init() {
        self.node = Node{left:null,right:null,parent:null};
    }
}
