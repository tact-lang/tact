struct Leaf {
    x: Int;
    y: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf;
}

struct Tree {
    root: Branch?;
}

contract TestContract {
    data: Tree;

    init() {
        self.data = Tree{
            root: Branch{
                left: null,
                right: Leaf{ x: 7, y: null }
            }
        };
    }
}