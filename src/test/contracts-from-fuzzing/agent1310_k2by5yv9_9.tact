struct Leaf { x: Int; }
struct Node { leaf: Leaf?; }

contract TestContract {
    data: Node?;

    init() {
        self.data = null;
    }
}
