struct LeafNode {
    txt: String? = "leaf";
    num: Int? = 5;
}

struct MiddleNode {
    node: LeafNode = LeafNode{};
    flag: Bool = true;
}

struct RootNode {
    layer: MiddleNode = MiddleNode{};
    title: String? = null;
}

contract NestedDefaults {
    root: RootNode;

    init() {
        self.root = RootNode{};
    }
}