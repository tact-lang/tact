struct InnerMost {
    x: Int?;
    y: Bool?;
}

struct Middle {
    mInt: Int;
    im: InnerMost;
    s: String;
}

struct Outer {
    oBool: Bool;
    m: Middle;
    aOpt: Address?;
}

contract TestContract {
    outer: Outer;
    init() {
        self.outer = Outer {
            oBool: true,
            m: Middle {
                mInt: 7,
                im: InnerMost { x: null, y: false },
                s: "deep"
            },
            aOpt: null
        };
    }
}