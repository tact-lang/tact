struct InnerMost {
    b1: Bool;
    num: Int;
}

struct Inner {
    im: InnerMost;
    s: String;
    flag2: Bool;
}

struct Middle {
    i: Int;
    inn: Inner;
    s2: String;
}

contract DeepNest {
    data: Middle;

    init() {
        self.data = Middle{
            i: 10,
            inn: Inner{
                im: InnerMost{b1: true, num: 99},
                s: "hello",
                flag2: false
            },
            s2: "done"
        };
    }
}
