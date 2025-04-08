struct OptionalTreeLeaf { val: Int?; }

struct OptionalNode {
    left: OptionalTreeLeaf?;
    right: OptionalTreeLeaf?;
}

struct OptionalTree {
    root: OptionalNode?;
}

contract OptionalTreeContract {
    tree: OptionalTree;

    init() {
        self.tree = OptionalTree { root: null };
    }
}