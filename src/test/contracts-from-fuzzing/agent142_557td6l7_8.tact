struct Inner {
    x: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract AssignOrder {
    state: Outer;

    init() {
        self.state = Outer{
            inner1: Inner{ x: 5 },
            inner2: Inner{ x: 10 }
        };
    }
}
