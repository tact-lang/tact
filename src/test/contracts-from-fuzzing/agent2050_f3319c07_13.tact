struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    x: InnerMost;
    y: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract MultiNest {
    storage: Outer;

    init() {
        self.storage = Outer {
            m1: Middle{
                x: InnerMost{ a:1, b:true },
                y: InnerMost{ a:2, b:false }
            },
            m2: Middle{
                x: InnerMost{ a:3, b:true },
                y: InnerMost{ a:4, b:false }
            }
        };
    }
}