struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    x: Int?;
    y: InnerMost;
}

struct Outer {
    foo: Inner?;
    bar: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            foo: Inner{
                x: null,
                y: InnerMost{
                    a: 1,
                    b: false,
                },
            },
            bar: 42,
        };
    }
}