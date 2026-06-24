struct Leaf {
    x: Int as uint4;
    y: Int? as uint8;
}

struct Middle {
    l1: Leaf;
    l2: Leaf?;
}

struct Root {
    m1: Middle;
    m2: Middle?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            m1: Middle{
                l1: Leaf{x:1,y:null},
                l2: null
            },
            m2: null
        };
    }
}
