struct InnerLeaf { x: Int }
struct MidNode { leaf: InnerLeaf }
struct RootNode { mid: MidNode }

contract Test22 {
    tree: RootNode;
    init() {
        self.tree = RootNode{ mid: MidNode{ leaf: InnerLeaf{ x:99 } } };
    }
}
