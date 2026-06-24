// Contract with nested optionals AND deeply nested
struct Leaf {
    flag: Bool;
    value: Int?;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    b1: Branch?;
    b2: Branch?;
}

contract OptionalTree {
    data: Tree;

    init() {
        self.data = Tree{
            b1: null,
            b2: null,
        };
    }
}