struct Leaf {
    x: Int;
}

struct Branch {
    child: Leaf?;
}

struct Tree {
    left: Branch?;
    right: Branch?;
}

contract OptionalTree {
    tree: Tree = Tree{
        left: null,
        right: null
    };
}