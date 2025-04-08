struct InnerMost { v1: Bool; v2: Int; }
struct Middle { m1: InnerMost; m2: Bool?; }
struct Outer {
    o1: Middle;
    o2: String;
}

contract FullNest {
    s: Outer;

    init() {
        self.s = Outer{
            o1: Middle{
                m1: InnerMost{
                    v1: true,
                    v2: 99,
                },
                m2: null,
            },
            o2: "outer",
        };
    }
}
