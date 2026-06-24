struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner1: Inner;
    inner2: Inner?;
    intOpt: Int?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            inner1: Inner{ a: 1, b: true },
            inner2: null,
            intOpt: null,
        };
    }
}