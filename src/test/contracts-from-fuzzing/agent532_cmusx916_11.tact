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

contract TreeContract {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{
                left: null,
                right: Leaf{val:5}
            }
        };
    }
}