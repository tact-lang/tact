struct Leaf {
    n: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch;
    label: String;
}

contract OptionalTree {
    t: Tree;

    init() {
        self.t = Tree{
            root: Branch{
                left: null,
                right: Leaf{n: 42}
            },
            label: "my tree"
        };
    }
}