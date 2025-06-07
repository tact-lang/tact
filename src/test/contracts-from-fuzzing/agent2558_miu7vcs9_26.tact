struct InnerMost {
    val: Int;
}

struct MidMid {
    inner: InnerMost;
}

struct Mid {
    midmid: MidMid;
}

struct Outer {
    mid: Mid;
}

contract FourLevels {
    data: Outer;

    init() {
        self.data = Outer{ mid: Mid{ midmid: MidMid{ inner: InnerMost{ val: 5 } } } };
    }
}