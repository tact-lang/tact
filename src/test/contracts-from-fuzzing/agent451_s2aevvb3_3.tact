struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    comment: String?;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                value: 123,
                flag: true,
            },
            comment: null,
        };
    }
}