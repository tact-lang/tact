struct Node {
    parent: Int;
    child: Int;
    sibling: Int;
}

contract TreeStructs {
    root: Node;
    init() {
        self.root = Node{
            parent:1,
            child:2,
            sibling:3
        };
    }
}