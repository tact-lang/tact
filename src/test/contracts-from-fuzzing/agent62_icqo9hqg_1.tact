struct InnerMost {
    a: Int;
}

struct Inner {
    x: Int;
    y: Int?;
    z: InnerMost;
}

struct Outer {
    s1: Inner;
    s2: Inner?;
}

contract NestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            s1: Inner{
                x: 1,
                y: 2,
                z: InnerMost{ a: 3 },
            },
            s2: null,
        };
    }
}