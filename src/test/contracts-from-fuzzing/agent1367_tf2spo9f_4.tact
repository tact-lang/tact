struct InnerMost {
    z: Int;
}

struct Inner {
    y: InnerMost;
    w: Int?;
}

struct Middle {
    m: Inner;
    n: Int;
    o: Inner?;
}

struct Outer {
    x: Middle;
    p: Middle?;
}

contract C {
    big: Outer;

    init() {
        self.big = Outer{
            x: Middle{
                m: Inner{
                    y: InnerMost{z: 10},
                    w: null
                },
                n: 20,
                o: null
            },
            p: null
        };
    }
}