struct Leaf {
    a: Int;
    b: Bool;
}

struct Branch {
    l1: Leaf;
    l2: Leaf;
}

struct Root {
    left: Branch;
    right: Branch;
}

contract TreeLike {
    root: Root;

    init() {
        self.root = Root{
            left: Branch{
                l1: Leaf{a:1, b:true},
                l2: Leaf{a:2, b:false},
            },
            right: Branch{
                l1: Leaf{a:3, b:true},
                l2: Leaf{a:4, b:false},
            },
        };
    }
}