struct InnerMost { a: Int; }

struct MiddleOptional {
    inner: InnerMost?;
}

struct TopMostOpt {
    middle: MiddleOptional?;
}

contract OptionalLayers {
    val: TopMostOpt;

    init() {
        self.val = TopMostOpt{
            middle: null
        };
    }
}