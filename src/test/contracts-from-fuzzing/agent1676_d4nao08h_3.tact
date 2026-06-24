struct Inner {
    value: Int?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract NestedStructTest {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{ value: null },
            flag: true
        };
    }
}
