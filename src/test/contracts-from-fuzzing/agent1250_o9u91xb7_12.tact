struct Leaf { v: Int; }
struct Branch { l: Leaf; r: Leaf; }
struct Tree { left: Branch; right: Branch; }

contract TreeStorage {
    storage: Tree;

    init() {
        self.storage = Tree{
            left: Branch{ l: Leaf{v:1}, r: Leaf{v:2} },
            right: Branch{ l: Leaf{v:3}, r: Leaf{v:4} }
        };
    }
}