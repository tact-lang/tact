struct Inner {
    x: Int as int64;
    y: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    count: Int as uint8;
}

contract Test2 {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 123, y: false },
            flag: true,
            count: 5,
        };
    }
}