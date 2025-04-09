struct Leaf {
    a: Int;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Root {
    node: Branch;
    flag: Bool;
}

contract TreeLike {
    r: Root;

    init() {
        self.r = Root{
            node: Branch{
                left: Leaf{ a: 1 },
                right: Leaf{ a: 2 }
            },
            flag: true
        };
    }
}