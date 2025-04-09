struct Leaf {
    name: String;
    n: Int? = null;
}

struct Branch {
    left: Leaf?;
    right: Leaf? = null;
}

struct Tree {
    root: Branch? = null;
    size: Int = 0;
}

contract DeepNullTree {
    t: Tree = Tree{ root: null, size: 0 };

    init() {
        self.t = Tree{
            root: Branch{
                left: Leaf{ name: "L", n: 1 },
                right: null
            },
            size: 1
        };
    }
}