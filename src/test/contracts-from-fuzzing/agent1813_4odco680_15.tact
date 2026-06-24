struct Leaf { a: Int; }

struct Mid1 { a: Int; leaf: Leaf; }
struct Mid2 { a: Int; leaf: Leaf; }

struct Root {
    left: Mid1;
    right: Mid2;
}

contract BinaryTree {
    tree: Root;

    init() {
        self.tree = Root{
            left: Mid1{ a:1, leaf: Leaf{a:10} },
            right: Mid2{ a:2, leaf: Leaf{a:20} }
        };
    }
}