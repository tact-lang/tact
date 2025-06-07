struct InnerMost {
    x: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract DefaultsDeepNested {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            middle: Middle{
                inner: InnerMost{
                    x: 5,
                },
            },
        };
    }
}