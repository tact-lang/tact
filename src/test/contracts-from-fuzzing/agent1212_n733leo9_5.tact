struct InnerLeaf {
    foo: Int? = null;
    bar: Bool? = null;
}

struct Branch {
    leaf1: InnerLeaf;
    leaf2: InnerLeaf;
}

struct Tree {
    branch: Branch;
    note: String? = null;
}

contract DeepOptionals {
    t: Tree = Tree{
        branch: Branch{
            leaf1: InnerLeaf{ foo: 123 },
            leaf2: InnerLeaf{},
        },
        note: "hello",
    };
    init() {}
}