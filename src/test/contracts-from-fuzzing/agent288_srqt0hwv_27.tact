struct InnerMost {
    a: Int;
    msg: String;
}

struct Inner {
    im: InnerMost;
    fl: Bool;
}

struct Middle {
    inr: Inner;
    count: Int;
}

struct Outer {
    mid: Middle;
    label: String;
}

contract TestContract {
    deep: Outer;

    init() {
        self.deep = Outer{
            mid: Middle{
                inr: Inner{
                    im: InnerMost{
                        a: 17,
                        msg: "innermost"
                    },
                    fl: true
                },
                count: 55
            },
            label: "outer"
        };
    }
}