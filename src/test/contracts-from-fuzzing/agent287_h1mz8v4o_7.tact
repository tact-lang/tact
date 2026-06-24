struct InnerMost { v: Int }

struct Inner {
    a: InnerMost;
    b: InnerMost;
    c: InnerMost;
}

struct Outer {
    ia: Inner;
    ib: Inner;
}

contract DeepWide {
    info: Outer;

    init() {
        self.info = Outer{
            ia: Inner{
                a: InnerMost{v:1},
                b: InnerMost{v:2},
                c: InnerMost{v:3},
            },
            ib: Inner{
                a: InnerMost{v:4},
                b: InnerMost{v:5},
                c: InnerMost{v:6},
            }
        };
    }
}