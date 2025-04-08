struct Inner {
    i: Int;
}

struct Middle {
    optInner: Inner?;
}

struct Outer {
    mid: Middle?;
}

contract OptOpt {
    storage: Outer;
    init() {
        self.storage = Outer{
            mid: Middle{optInner: null}
        };
    }
}