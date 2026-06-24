struct InnerMost {
    alpha: Int;
    beta: String;
}

struct Inner {
    b: Bool;
    im: InnerMost;
}

struct Middle {
    count: Int;
    inner: Inner;
    flag: Bool?;
}

struct Outer {
    m: Middle;
}

contract DeeplyNested {
    oo: Outer;

    init() {
        self.oo = Outer{
            m: Middle{
                count: 0,
                inner: Inner{b: false, im: InnerMost{alpha: 1, beta: "b"}},
                flag: null
            }
        };
    }

    receive() {
        self.oo = self.oo;
    }
}