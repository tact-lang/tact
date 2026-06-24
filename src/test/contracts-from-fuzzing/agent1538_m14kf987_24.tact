struct Leaf {
    val: Int = 111;
}

struct Mid {
    optLeaf: Leaf?;
}

struct Root {
    left: Mid?;
    right: Mid?;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            left: Mid{ optLeaf: Leaf{} },
            right: null
        };
    }
}