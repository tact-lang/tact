struct Node {
    id: Int;
    parentId: Int?;
    name: String;
}

contract OptionalIdTree {
    root: Node;

    init() {
        self.root = Node{
            id: 1,
            parentId: null,
            name: "root"
        };
    }
}