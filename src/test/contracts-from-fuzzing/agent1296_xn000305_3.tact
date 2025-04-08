struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 5,
                y: true,
            },
            flag: false,
        };
    }
}
