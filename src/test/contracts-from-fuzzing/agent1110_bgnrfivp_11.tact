struct InnerMost {
    val: Int;
}

struct NextInner {
    im1: InnerMost;
    im2: InnerMost;
}

struct NextOuter {
    ni1: NextInner;
    ni2: NextInner;
}

contract FourDeep {
    nest: NextOuter;

    init() {
        self.nest = NextOuter{
            ni1: NextInner{ im1: InnerMost{ val:1 }, im2: InnerMost{ val:2 } },
            ni2: NextInner{ im1: InnerMost{ val:3 }, im2: InnerMost{ val:4 } }
        };
    }
}