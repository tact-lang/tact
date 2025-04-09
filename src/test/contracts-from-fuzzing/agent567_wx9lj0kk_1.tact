struct Inner {
    f1: Int = 1;
    f2: Bool = false;
}

struct Outer {
    nested: Inner;
    optNested: Inner?;
    num: Int = 7;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{f1: 10, f2: true},
            optNested: null,
            num: 42,
        };
    }
}
