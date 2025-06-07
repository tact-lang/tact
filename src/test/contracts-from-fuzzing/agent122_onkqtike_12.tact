struct InnerMost {
    f1: Int;
    f2: Bool;
}

struct Middle {
    im: InnerMost;
    s: String;
}

struct OuterMost {
    m: Middle;
    b: Bool;
}

contract NestedComplex {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m: Middle{
                im: InnerMost{ f1:1, f2:false },
                s: "hi"
            },
            b: true
        };
    }
}