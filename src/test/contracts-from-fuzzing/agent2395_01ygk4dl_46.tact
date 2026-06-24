struct SInner {
    s: String?;
    b: Bool?;
}

struct Middle {
    inr: SInner;
}

struct Outer {
    mid: Middle;
}

contract NullDeepNest {
    f: Outer;

    init() {
        self.f = Outer{
            mid: Middle{
                inr: SInner{
                    s: null,
                    b: null
                }
            }
        };
    }
}
