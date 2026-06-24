struct InnerMost {
    x: Int?;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inn: Inner;
}

struct OuterMost {
    m: Middle;
}

contract DeepestNesting {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            m: Middle{
                inn: Inner{
                    im: InnerMost{
                        x: null,
                    },
                },
            },
        };
    }
}