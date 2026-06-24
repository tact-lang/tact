struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    x: Int;
    inner: Inner;
    y: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: 5,
            inner: Inner{ flag: false, count: 10 },
            y: true,
        };
    }
}