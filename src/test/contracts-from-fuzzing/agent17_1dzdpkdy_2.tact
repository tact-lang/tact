struct Inner { v: Int; }

struct Outer {
    inner: Inner;
    n: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ v: 99 },
            n: 100,
        };
    }
}