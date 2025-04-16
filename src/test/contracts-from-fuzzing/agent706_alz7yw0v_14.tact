struct Inner {
    n: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    inner3: Inner;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            inner1: Inner{n: 1},
            inner2: Inner{n: 2},
            inner3: Inner{n: 3},
        };
    }
}