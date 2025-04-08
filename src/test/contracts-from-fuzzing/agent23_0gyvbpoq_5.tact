struct Inner {
    flag: Bool;
    opt: Int?;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
}

contract NestedOpt {
    s: Outer;

    init() {
        self.s = Outer{
            mid: Middle{
                inner: Inner{
                    flag: true,
                    opt: null
                }
            }
        };
    }
}