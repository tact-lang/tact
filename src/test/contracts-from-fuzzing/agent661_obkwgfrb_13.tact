struct InnerMost {
    x: Int;
}

struct InnerMid {
    m: InnerMost;
}

struct Container {
    mid: InnerMid;
    other: Int;
}

contract DeepTree {
    root: Container;

    init() {
        self.root = Container{
            mid: InnerMid{ m: InnerMost{ x: 5 } },
            other: 11
        };
    }
}