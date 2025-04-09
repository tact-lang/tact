// mix of deeply nested structs within optional containers

struct Leaf {
    v: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract TreeContract {
    t: Tree;

    init() {
        self.t = Tree {
            branch: Branch {
                leaf: null
            }
        };
    }
}