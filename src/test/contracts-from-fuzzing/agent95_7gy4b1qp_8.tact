struct SDeep {
    x: Int;
}

struct MDeep {
    s: SDeep;
}

struct LDeep {
    m: MDeep;
}

struct XDeep {
    l: LDeep;
}

struct FinalDeep {
    x: XDeep;
}

contract DeepNestedContract {
    f: FinalDeep;

    init() {
        self.f = FinalDeep{
            x: XDeep{
                l: LDeep{
                    m: MDeep{
                        s: SDeep{ x: 999 }
                    }
                }
            }
        };
    }
}