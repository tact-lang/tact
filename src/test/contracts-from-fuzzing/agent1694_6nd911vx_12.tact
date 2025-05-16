struct Leaf { amount: Int; }
struct Node { child: Leaf?; }

contract NestOpt {
    tree: Node?;

    init() {
        self.tree = null;
    }
}