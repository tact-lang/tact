struct Leaf {
    d: Int;
    e: Bool;
}

struct Branch {
    b: Leaf;
    c: Int;
}

struct Root {
    a: Branch;
}

contract DeepNested {
    root: Root = Root{
        a: Branch{
            b: Leaf{ d: 1, e: false },
            c: 2,
        }
    };
}