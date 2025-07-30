struct InnerMost {
    val: Int?;
}

struct Inner {
    innerMost: InnerMost;
    another: Int;
}

struct Outer {
    nested: Inner;
    opt: Bool?;
}

contract ManyNested {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{
                innerMost: InnerMost{
                    val: null,
                },
                another: 5,
            },
            opt: true,
        };
    }
}