struct LeafNode { val: Int }
struct ParentNode { child: LeafNode }
struct RootNode { branch: ParentNode }

contract ComplexNestedFinalOptional {
    root: RootNode?;
    init() {
        self.root = null;
    }
}