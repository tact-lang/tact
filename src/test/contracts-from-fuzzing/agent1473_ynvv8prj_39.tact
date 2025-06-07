struct InnerMost {
    val: Int;
}

struct InnerMiddle {
    innerMost: InnerMost;
}

struct InnerOuter {
    innerMiddle: InnerMiddle;
}

contract TestContract {
    io: InnerOuter;

    init() {
        self.io = InnerOuter{ innerMiddle: InnerMiddle{ innerMost: InnerMost{ val: 777 } } };
    }
}