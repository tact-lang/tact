struct InnerMost {
    val: Int;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

struct Outer {
    a: Inner;
    b: Int;
    c: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner{
                x: 2,
                y: InnerMost{val: 99},
            },
            b: 5,
            c: true,
        };
    }
}