struct NestedMany {
    a: Int;
    s1: Inner;
    s2: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    n: NestedMany;

    init() {
        self.n = NestedMany{
            a:1,
            s1: Inner{ x:2,y:3 },
            s2: Inner{ x:4,y:5 }
        };
    }
}
