struct InnerMost {
    val: Int;
}

struct MidLevel {
    inner: InnerMost?;
}

struct TopLevel {
    mid: MidLevel;
}

contract OptionalInsideNested {
    t: TopLevel;
    init() {
        self.t = TopLevel{
            mid: MidLevel{
                inner: null
            }
        };
    }
}