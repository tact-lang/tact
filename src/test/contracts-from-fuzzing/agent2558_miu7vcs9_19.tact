struct Inner {
    v1: Int?;
    v2: Bool;
}

struct Outer {
    in1: Inner?;
    in2: Inner;
}

contract NestedMultiOpt {
    x: Outer;

    init() {
        self.x = Outer{
            in1: Inner{
                v1: null,
                v2: true,
            },
            in2: Inner{
                v1: 3,
                v2: false,
            }
        };
    }
}