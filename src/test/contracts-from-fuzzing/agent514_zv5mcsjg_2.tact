struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer = Outer{
        inner: Inner{ val: 10 },
        flag: true,
    };

    init() {
        self.data = Outer{
            inner: Inner{ val: 42 },
            flag: false,
        };
    }
}