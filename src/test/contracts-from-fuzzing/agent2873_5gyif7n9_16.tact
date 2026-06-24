struct TinyInner {
    f: Bool;
}

struct Middle {
    i: Int;
    t: TinyInner;
}

struct Top {
    m: Middle;
}

contract NestedChain {
    top: Top;
    init() {
        self.top = Top{
            m: Middle{
                i: 10,
                t: TinyInner{f:true}
            }
        };
    }
}