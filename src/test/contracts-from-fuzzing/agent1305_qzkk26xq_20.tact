struct InnerLayer {
    x: Int;
}

struct OuterLayer {
    inners: InnerLayer;
    optInner: InnerLayer?;
}

contract BigNested {
    val: OuterLayer;

    init() {
        self.val = OuterLayer{
            inners: InnerLayer{ x: 42 },
            optInner: null,
        };
    }
}