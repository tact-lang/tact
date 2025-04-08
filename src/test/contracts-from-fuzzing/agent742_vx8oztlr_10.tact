struct Leaf {
    v: Int;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    mid: Middle;
}

contract TestContract {
    root: Root = Root{
        mid: Middle{
            leaf: null
        }
    };
    init() {}
}