struct SInner {
    innerVal: Int?;
    innerFlag: Bool?;
}

struct SMiddle {
    s: SInner;
}

struct SOuter {
    m: SMiddle;
}

contract OptionalDeepWrapper {
    wrap: SOuter;

    init() {
        self.wrap = SOuter{
            m: SMiddle{
                s: SInner{
                    innerVal: null,
                    innerFlag: true
                }
            }
        };
    }
}