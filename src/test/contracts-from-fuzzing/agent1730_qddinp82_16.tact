struct Leaf {
    x: Int;
    y: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Node?;
}

contract NestedOptionals {
    t: Tree;

    init() {
        self.t = Tree{
            root: Node{
                left: null,
                right: Leaf{ x: 5, y: 10 }
            }
        };
    }
}