struct Inner {
    i: Int;
    b: Bool;
}

struct MidOpt {
    innerStructOpt: Inner?;
}

struct Outer {
    mid: MidOpt;
}

contract OptMidLevel {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: MidOpt{
                innerStructOpt: null,
            },
        };
    }
}