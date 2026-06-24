struct Leaf {
    val: Int;
}

struct Mid {
    x: Leaf;
    y: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
    m3: Mid;
}

contract MultipleNested {
    r: Root;

    init() {
        self.r = Root{
            m1: Mid{ x: Leaf{val:1}, y: Leaf{val:2} },
            m2: Mid{ x: Leaf{val:3}, y: Leaf{val:4} },
            m3: Mid{ x: Leaf{val:5}, y: Leaf{val:6} }
        };
    }
}