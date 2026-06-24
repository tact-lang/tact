struct Inner {
    a: Int;
}

struct Outer {
    s1: Inner;
    s2: Inner;
}

contract TestContract {
    big: Outer;
    init() {
        self.big = Outer{
            s1: Inner{ a: 10 },
            s2: Inner{ a: 20 }
        };
    }
}