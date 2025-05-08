struct Leaf {
    x: Int;
    y: Bool;
}

struct MiddleLevel {
    a: Leaf;
    b: Leaf;
    c: Leaf;
}

struct Root {
    m1: MiddleLevel;
    m2: MiddleLevel;
}

contract Tree {
    data: Root;

    init() {
        self.data = Root{
            m1: MiddleLevel{
                a: Leaf{x:1, y:true},
                b: Leaf{x:2, y:false},
                c: Leaf{x:3, y:true},
            },
            m2: MiddleLevel{
                a: Leaf{x:4, y:false},
                b: Leaf{x:5, y:true},
                c: Leaf{x:6, y:false},
            }
        };
    }
}