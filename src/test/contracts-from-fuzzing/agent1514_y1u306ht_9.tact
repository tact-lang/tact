struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract TestContract {
    t: Tree = Tree{root: null};

    init() {
        self.t = Tree{
            root: Branch{
                left: Leaf{val: 1},
                right: Leaf{val: 2}
            }
        };
    }
}