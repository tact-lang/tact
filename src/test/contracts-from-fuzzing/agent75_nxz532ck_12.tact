struct Leaf { val: Int? }

struct Node { leaf: Leaf? }

contract Test {
    root: Node?;

    init() {
        self.root = null;
    }
}