struct InnerMost {
    val: Int;
}

struct InnerMiddle {
    im: InnerMost;
}

struct InnerOuter {
    mid: InnerMiddle;
}

contract DeepChain {
    deep: InnerOuter;

    init() {
        self.deep = InnerOuter{ mid: InnerMiddle{ im: InnerMost{ val: 123 } } };
    }
}