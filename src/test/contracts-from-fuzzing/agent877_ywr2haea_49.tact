// Optional struct, inside struct, inside optional persistent field
struct Leaf {
    z: Int;
}

struct Branch {
    leaf: Leaf?;
}

contract OptionalTree {
    tree: Branch?;

    init() {
        self.tree = null;
    }
}