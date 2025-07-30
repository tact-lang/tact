struct InnerMost {
    val: String;
}

struct InnerMid {
    inner: InnerMost;
}

struct InnerTop {
    inner: InnerMid;
}

contract NestedLongChain {
    data: InnerTop;

    init() {
        self.data = InnerTop{
            inner: InnerMid{
                inner: InnerMost{
                    val: "deep"
                }
            }
        };
    }
}