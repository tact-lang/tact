struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inner: Inner?;
    s: String;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ a: 42, b: null },
            s: "hi",
        };
    }
}