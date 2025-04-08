struct InnerMost {
    x: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct Middle {
    innermid: InnerMid;
}

struct Outer {
    mid: Middle;
}

contract ChainFour {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                innermid: InnerMid{
                    im: InnerMost{x:99}
                }
            }
        };
    }
}
