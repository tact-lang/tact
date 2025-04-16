struct Leaf {
    leaf_val: Int;
}

struct Branch {
    leaf: Leaf;
    flag: Bool;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract MultiTree {
    root: Root;

    init() {
        self.root = Root{
            branch1: Branch{leaf:Leaf{leaf_val:1},flag:true},
            branch2: Branch{leaf:Leaf{leaf_val:2},flag:false}
        };
    }
}