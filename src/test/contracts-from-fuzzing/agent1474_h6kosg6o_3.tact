struct Leaf {
    x: Int;
    y: Int?;
    flag: Bool;
}

struct Middle {
    left: Leaf;
    right: Leaf;
}

struct Root {
    m1: Middle;
    m2: Middle;
}

contract TreeTest {
    root: Root;
    
    init() {
        self.root = Root{
            m1: Middle{
                left: Leaf{ x: 1, y: null, flag: true },
                right: Leaf{ x: 2, y: 3, flag: false }
            },
            m2: Middle{
                left: Leaf{ x: 4, y: null, flag: false },
                right: Leaf{ x: 5, y: 6, flag: true }
            }
        };
    }
}
