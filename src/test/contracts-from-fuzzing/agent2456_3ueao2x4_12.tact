struct Leaf {
    val: Int;
}

struct Composite {
    a: Leaf;
    b: Leaf;
    c: Leaf;
    d: Leaf;
    e: Leaf;
    f: Leaf;
}

contract LargeNestedStruct {
    big: Composite;

    init() {
        self.big = Composite{
            a: Leaf{val:1},
            b: Leaf{val:2},
            c: Leaf{val:3},
            d: Leaf{val:4},
            e: Leaf{val:5},
            f: Leaf{val:6}
        };
    }
}