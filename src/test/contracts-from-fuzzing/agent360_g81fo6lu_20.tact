struct InnerMost {
    value: Int;
}

struct Middle {
    nested: InnerMost?;
}

struct TopLayer {
    middle: Middle?;
}

contract TestContract {
    data: TopLayer;

    init() {
        self.data = TopLayer{ middle: Middle{ nested: null } };
    }
}