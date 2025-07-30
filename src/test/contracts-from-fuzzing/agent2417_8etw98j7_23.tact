struct MidInner {
    a: Int;
}

struct MidOuter {
    inner: MidInner;
}

struct Top {
    mid: MidOuter;
}

contract ChainWrap {
    top: Top;

    init() {
        self.top = Top{
            mid: MidOuter{
                inner: MidInner{ a: 5 }
            }
        };
    }
}
