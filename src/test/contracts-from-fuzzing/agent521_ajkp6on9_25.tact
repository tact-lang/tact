struct Leaf { l: Int }
struct Node { left: Leaf?; right: Leaf? }
struct Tree {
    root: Node?;
}
contract OptTree {
    tree: Tree;

    init() {
        self.tree = Tree{
            root: Node{
                left: null,
                right: null,
            }
        };
    }
}