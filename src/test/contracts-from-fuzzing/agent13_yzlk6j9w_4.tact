struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    im1: InnerMost;
    im2: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract DeepNest {
    nest: Outer;

    init() {
        self.nest = Outer{
            m1: Middle{
                im1: InnerMost{ x:1, y:true },
                im2: InnerMost{ x:2, y:false }
            },
            m2: Middle{
                im1: InnerMost{ x:3, y:true },
                im2: InnerMost{ x:4, y:false }
            }
        };
    }
}