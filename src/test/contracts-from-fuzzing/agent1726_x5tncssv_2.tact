struct Deep {
    a: Int;
    b: Bool;
}

struct Middle {
    d1: Deep;
    d2: Deep;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract DeepNest {
    storage: Outer;

    init() {
        self.storage = Outer{
            m1: Middle{
                d1: Deep{a:1,b:true},
                d2: Deep{a:2,b:false},
            },
            m2: Middle{
                d1: Deep{a:3,b:true},
                d2: Deep{a:4,b:false},
            },
        };
    }
}