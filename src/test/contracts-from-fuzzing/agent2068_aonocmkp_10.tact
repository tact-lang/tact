struct InnerMost {
    data: Int?;
}

struct Mid {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct Outer {
    mid: Mid;
    maybeMid: Mid?;
}

contract OptNest {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Mid{inner:InnerMost{data:null}, optInner:null},
            maybeMid: null
        };
    }
}