struct Leaf { val: Int; }
struct Branch { l: Leaf; r: Leaf; }
struct Tree {
    top: Branch;
    bottom: Branch;
}

contract TestContract {
    tree: Tree;

    init() {
        self.tree = Tree{
            top: Branch{ l: Leaf{val:1}, r: Leaf{val:2} },
            bottom: Branch{ l: Leaf{val:3}, r: Leaf{val:4} },
        };
    }
}