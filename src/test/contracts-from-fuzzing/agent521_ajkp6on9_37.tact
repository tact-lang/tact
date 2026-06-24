struct Leaf { value: Int }
struct Node { left: Leaf; right: Leaf }

contract LargeTree {
    n: Node;

    init() {
        self.n = Node{
            left: Leaf{value:111},
            right: Leaf{value:222},
        };
    }
}