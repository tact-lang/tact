struct Leaf {
    x: Int;
    y: Int;
}

struct Mid {
    left: Leaf;
    right: Leaf;
}

struct Root {
    m1: Mid;
    m2: Mid;
}

contract TreeStruct {
    tree: Root;

    init() {
        self.tree = Root{
            m1: Mid{
                left: Leaf{x:1,y:2}, right: Leaf{x:3,y:4}
            },
            m2: Mid{
                left: Leaf{x:5,y:6}, right: Leaf{x:7,y:8}
            }
        };
    }
}