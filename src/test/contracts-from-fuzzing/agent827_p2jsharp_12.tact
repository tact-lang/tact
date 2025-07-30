struct Leaf {
    value: Int?;
}

struct Mid {
    node: Leaf?;
    flag: Bool;
}

struct Root {
    branch: Mid?;
    count: Int;
}

contract OptionalTree {
    tree: Root = Root{
        branch: null,
        count: 7
    };

    receive() {
        self.tree = self.tree;
    }
}