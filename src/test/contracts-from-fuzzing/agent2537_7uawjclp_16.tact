struct Inner {
    x: Int;
    flag: Bool;
}

struct Middle {
    inr: Inner;
    msg: String;
}

struct Outer {
    mid: Middle;
    description: String;
    optVal: Int?;
}

contract StoreOuter {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Middle{
                inr: Inner{ x: 42, flag: true },
                msg: "deep"
            },
            description: "outer",
            optVal: null
        };
    }
}