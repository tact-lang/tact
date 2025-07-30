struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    i1: InnerMost;
    i2: InnerMost?;
}

struct OuterMost {
    m1: Middle;
    m2: Middle?;
    txt: String;
}

contract OptionalNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m1: Middle{
                i1: InnerMost{a:1,b:true},
                i2: null
            },
            m2: null,
            txt: "deep opt"
        };
    }
}
