struct Leaf { a: Int }
struct Node { left: Leaf; right: Leaf }
struct Tree { root: Node; flag: Bool }

contract DeepTree {
    data: Tree;
    init() {
        self.data = Tree{ root: Node{ left: Leaf{a:1}, right: Leaf{a:2} }, flag: true };
    }
}