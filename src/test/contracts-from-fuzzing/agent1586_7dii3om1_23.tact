struct Leaf {
    value: String;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Tree {
    root: Branch?;
}

contract TestContract {
    tree: Tree?;

    init() {
        self.tree = Tree{
            root: Branch{
                left: null,
                right: Leaf{ value: "hello world" }
            }
        };
    }

    receive() {}
}