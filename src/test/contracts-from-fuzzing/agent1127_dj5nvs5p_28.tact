struct Leaf { x: Int }
struct Node {
    left: Leaf;
    right: Leaf;
}

struct Wrapper {
    root: Node;
}

contract TreeTest {
    d: Wrapper;

    init() {
        self.d = Wrapper{
            root: Node{
                left: Leaf{ x: 1 },
                right: Leaf{ x: 2 },
            },
        };
    }
}
