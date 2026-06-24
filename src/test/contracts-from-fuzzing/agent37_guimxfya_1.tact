struct Inner {
    flag: Bool;
    count: Int?;
}

struct Outer {
    inner: Inner;
    value: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                count: null,
            },
            value: 42,
        };
    }
}