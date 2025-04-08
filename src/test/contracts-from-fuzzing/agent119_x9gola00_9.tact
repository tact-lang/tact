struct Leaf {
    val: Int?;
}

struct Node {
    val: Int;
    left: Leaf?;
    right: Leaf?;
}

contract TestContract {
    node: Node;

    init() {
        self.node = Node{
            val: 5,
            left: Leaf{val:null},
            right: null
        };
    }

    receive() {
        let q = self.node;
    }
}