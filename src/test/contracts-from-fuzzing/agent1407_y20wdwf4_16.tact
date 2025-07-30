struct Inner {
    n: Int as uint32;
    m: Int as int8;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ n: 100, m: -5 },
            flag: true
        };
    }
}