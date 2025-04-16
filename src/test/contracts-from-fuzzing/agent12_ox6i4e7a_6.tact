struct InnerMost {
    val: Int;
}

struct InnerMiddle {
    i: InnerMost;
}

struct InnerOuter {
    m: InnerMiddle;
}

contract DeepChain {
    data: InnerOuter;

    init() {
        self.data = InnerOuter{
            m: InnerMiddle{
                i: InnerMost{val: 77},
            }
        };
    }

    receive() {
        self.data.m.i.val = 1;
    }
}
