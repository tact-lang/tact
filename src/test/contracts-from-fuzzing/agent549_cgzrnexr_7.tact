struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Mid {
    ia: InnerA;
    ib: InnerB;
    opt: Int?;
}

struct Top {
    m: Mid;
    mOpt: Mid?;
}

contract Layered {
    t: Top;

    init() {
        self.t = Top{
            m: Mid{
                ia: InnerA{ a: 1 },
                ib: InnerB{ b: true },
                opt: null,
            },
            mOpt: null,
        };
    }

    receive() {
        self.t = Top{
            m: Mid{
                ia: InnerA{ a: 2 },
                ib: InnerB{ b: false },
                opt: 999,
            },
            mOpt: null,
        };
    }
}