struct Leaf {
    value: Int;
}

struct Branch {
    leaf: Leaf?;
    description: String;
}

struct Tree {
    left: Branch?;
    right: Branch?;
    id: Int;
}

contract TestContract {
    data: Tree;

    init() {
        self.data = Tree{
            left: null,
            right: Branch{
                leaf: Leaf{value: 999},
                description: "branch"
            },
            id: 42
        };
    }
}
