struct Leaf { val: Int; }
struct Branch { leaf: Leaf?; }
struct Tree { branch: Branch?; }

contract Forest {
    tree: Tree?;

    init() {
        self.tree = Tree {
            branch: Branch {
                leaf: Leaf { val: 77 },
            },
        };
    }

    receive() {}
}
