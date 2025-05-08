struct InnerMost {
    value: Int;
    opt: Int?;
}

struct Middle {
    left: InnerMost;
    right: InnerMost;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract TestContract {
    d: Outer;

    init() {
        self.d = Outer{
            mid1: Middle{ left: InnerMost{value:1, opt:null}, right: InnerMost{value:2, opt:3} },
            mid2: Middle{ left: InnerMost{value:4, opt:null}, right: InnerMost{value:5, opt:null} }
        };
    }
}