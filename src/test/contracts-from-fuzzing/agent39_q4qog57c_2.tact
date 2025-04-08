struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner1: Inner{ x: 1, y: 2 },
            inner2: Inner{ x: 3, y: 4 },
        };
    }
}