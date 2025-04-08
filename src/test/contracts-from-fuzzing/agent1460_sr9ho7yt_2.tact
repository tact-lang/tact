struct InnerMost {
    z: Int?;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract NestedStructs {
    state: Outer;

    init() {
        self.state = Outer{
            x: Inner{
                y: InnerMost{
                    z: null,
                },
            },
        };
    }
}
