struct InnerMost {
    u: Int;
}

struct Middle {
    t: Int;
    inner: InnerMost;
}

struct Outer {
    s: Int;
    middle: Middle;
}

contract SuperNested {
    info: Outer;

    init() {
        self.info = Outer{
            s: 1,
            middle: Middle{
                t: 2,
                inner: InnerMost{
                    u:3
                }
            }
        };
    }
}
