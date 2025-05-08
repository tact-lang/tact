struct Final {
    u: Int;
    v: Bool?;
    w: String;
}

struct Middle {
    m1: Final;
    m2: Final;
}

contract FinalNest {
    s: Middle;

    init() {
        self.s = Middle{
            m1: Final{ u: 1, v: null, w: "x" },
            m2: Final{ u: 2, v: true, w: "y" }
        };
    }
}