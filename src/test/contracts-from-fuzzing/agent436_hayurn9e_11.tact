struct Leaf {
    val: Int;
}

struct Branch1 {
    l: Leaf;
    r: Leaf;
}

struct Branch2 {
    l: Branch1;
    r: Branch1;
}

struct Root {
    l: Branch2;
    r: Branch2;
}

contract TestContract {
    tree: Root;
    init() {
        self.tree = Root{
            l: Branch2{
                l: Branch1{ l: Leaf{val:1}, r: Leaf{val:2} },
                r: Branch1{ l: Leaf{val:3}, r: Leaf{val:4} }
            },
            r: Branch2{
                l: Branch1{ l: Leaf{val:5}, r: Leaf{val:6} },
                r: Branch1{ l: Leaf{val:7}, r: Leaf{val:8} }
            }
        };
    }
}
