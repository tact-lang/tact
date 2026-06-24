struct Leaf {
    flag: Bool;
}

struct Branch {
    leaf1: Leaf;
    leaf2: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
}

contract BinaryTreeStorage {
    tree: Tree;
    init() {
        self.tree = Tree{
            left: Branch{
                leaf1: Leaf{flag:true},
                leaf2: Leaf{flag:false}
            },
            right: Branch{
                leaf1: Leaf{flag:false},
                leaf2: Leaf{flag:true}
            }
        };
    }
}