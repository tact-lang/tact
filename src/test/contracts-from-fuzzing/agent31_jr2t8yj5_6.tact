struct InnerMost {
    value: Int;
}

struct Inner {
    a: InnerMost;
    b: InnerMost;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            one: Inner{
                a: InnerMost{ value: 1 },
                b: InnerMost{ value: 2 },
            },
            two: Inner{
                a: InnerMost{ value: 3 },
                b: InnerMost{ value: 4 },
            },
        };
    }
}
