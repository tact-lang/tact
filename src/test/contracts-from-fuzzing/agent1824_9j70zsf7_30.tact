// Large nested struct tree
struct Leaf {
    x: Int;
}

struct Branch1 {
    a: Leaf;
    b: Leaf;
}

struct Branch2 {
    a: Branch1;
    b: Branch1;
}

struct Root {
    left: Branch2;
    right: Branch2;
}

contract HugeNestedTree {
    root: Root;

    init() {
        self.root = Root{
            left: Branch2{
                a: Branch1{ a: Leaf{x:1}, b: Leaf{x:2} },
                b: Branch1{ a: Leaf{x:3}, b: Leaf{x:4} }
            },
            right: Branch2{
                a: Branch1{ a: Leaf{x:5}, b: Leaf{x:6} },
                b: Branch1{ a: Leaf{x:7}, b: Leaf{x:8} }
            }
        };
    }
}
