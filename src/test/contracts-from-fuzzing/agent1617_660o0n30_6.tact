struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    im1: InnerMost;
    im2: InnerMost;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract RepeatedNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{
                im1: InnerMost{ a:1, b:true },
                im2: InnerMost{ a:2, b:false }
            },
            m2: Middle{
                im1: InnerMost{ a:3, b:true },
                im2: InnerMost{ a:4, b:false }
            }
        };
    }
}
