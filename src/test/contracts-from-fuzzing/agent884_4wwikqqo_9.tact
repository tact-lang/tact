struct Node {
    child: Leaf;
}

struct Leaf {
    val: Int;
}

contract OrderTest {
    data: Node;

    init() {
        self.data = Node{ child: Leaf{val:5} };
    }
}