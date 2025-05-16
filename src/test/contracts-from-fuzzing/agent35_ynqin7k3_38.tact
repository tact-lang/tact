struct InnerMost {
    v: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct InnerOuter {
    mid: InnerMid;
}

contract InitNested {
    data: InnerOuter;

    init() {
        self.data = InnerOuter{
            mid: InnerMid{
                im: InnerMost{
                    v: 99
                }
            }
        };
    }
}