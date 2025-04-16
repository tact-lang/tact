struct InnerMost {
    p: Int;
    q: Bool;
}

struct Middle {
    aa: InnerMost;
    bb: InnerMost?;
}

struct Outer {
    first: Middle;
    second: Middle?;
    third: Middle;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            first: Middle{
                aa: InnerMost{p:1,q:true},
                bb: null
            },
            second: null,
            third: Middle{
                aa: InnerMost{p:2,q:false},
                bb: InnerMost{p:3,q:true}
            }
        };
    }
}