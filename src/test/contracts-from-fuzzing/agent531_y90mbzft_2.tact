struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ flag: true },
            num: 5
        };
    }
}