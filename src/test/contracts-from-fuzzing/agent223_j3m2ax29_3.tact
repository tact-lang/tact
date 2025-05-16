struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract OptionalNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 7,
                y: null,
            },
            flag: false,
        };
    }
}