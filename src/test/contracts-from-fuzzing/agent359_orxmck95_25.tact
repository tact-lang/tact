struct Leaf {
    foo: Int?;
}

struct Branch {
    leaf: Leaf?;
    num: Int;
}

struct Tree {
    branch: Branch;
    label: String?;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            branch: Branch{ leaf: null, num: 5 },
            label: null
        };
    }
}