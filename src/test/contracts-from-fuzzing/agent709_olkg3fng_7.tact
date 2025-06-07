struct Leaf {
    val: Int;
}

struct Branch {
    leaf: Leaf?;
    desc: String?;
}

struct Tree {
    branch: Branch?;
    label: String;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            branch: Branch{
                leaf: null,
                desc: null,
            },
            label: "root"
        };
    }
}