struct InnerMost {
    z: Int?;
}

struct Inner {
    y: Bool?;
    innerMost: InnerMost;
}

struct Middle {
    x: Int;
    inner: Inner;
}

struct Outer {
    s: String;
    middle: Middle;
}

contract DeeplyOptional {
    data: Outer;

    init() {
        self.data = Outer{
            s: "str",
            middle: Middle{
                x: 99,
                inner: Inner{
                    y: null,
                    innerMost: InnerMost{ z:null }
                }
            }
        };
    }
}