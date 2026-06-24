struct InnerMost {
    z: Bool?;
}

struct Inner {
    y: InnerMost?;
}

struct Outer {
    x: Inner?;
}

contract DeepOptionals {
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
