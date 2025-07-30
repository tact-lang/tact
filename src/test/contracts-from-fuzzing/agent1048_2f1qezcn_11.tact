struct InnerMost {
    val: Int;
}

struct Middle {
    inr: InnerMost;
}

struct Top {
    mid: Middle;
}

contract TripleNest {
    deep: Top;

    init() {
        self.deep = Top{
            mid: Middle{
                inr: InnerMost{
                    val: 42,
                },
            },
        };
    }
}