struct Inner {
    flag: Bool;
}

struct Outer {
    inn1: Inner;
    inn2: Inner?;
    optBool: Bool?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inn1: Inner{ flag: true },
            inn2: null,
            optBool: null
        };
    }
}