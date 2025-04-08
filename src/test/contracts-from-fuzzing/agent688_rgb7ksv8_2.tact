struct Inner {
    x: Int = 1;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    label: String = "test";
    flag: Bool?;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 42,
                y: true,
            },
            flag: false,
        };
    }
}
