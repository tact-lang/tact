struct Leaf {
    val: String;
    ok: Bool?;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool;
}

struct Tree {
    m: Mid?;
    note: String;
}

contract NestedOptionStrings {
    t: Tree;

    init() {
        self.t = Tree{
            m: null,
            note: "hi"
        };
    }
}