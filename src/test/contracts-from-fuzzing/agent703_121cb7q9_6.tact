struct Leaf {
    value: Int?;
}

struct Node {
    leaf: Leaf;
    flag: Bool;
}

contract TestContract {
    data: Node;

    init() {
        self.data = Node{
            leaf: Leaf{ value: null },
            flag: true
        };
    }
}