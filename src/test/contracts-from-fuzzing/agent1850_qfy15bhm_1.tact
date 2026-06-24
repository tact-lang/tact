struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 1,
                y: true,
            },
            flag: false,
            count: 42,
        };
    }
}
