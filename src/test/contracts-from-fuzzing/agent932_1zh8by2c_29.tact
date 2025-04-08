// Optional nested struct with default null, chain traversing
struct Leaf {
    a: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract OptionalStructChain {
    t: Tree?;

    init() {
        self.t = null;
    }
}