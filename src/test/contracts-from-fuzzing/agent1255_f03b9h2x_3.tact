struct InnerMost {
    z: Bool;
}

struct Inner {
    y: InnerMost;
}

struct Outer {
    x: Inner;
}

contract Test3 {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{
                y: InnerMost{
                    z: true,
                },
            },
        };
    }
}