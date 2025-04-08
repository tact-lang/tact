struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract Test {
    data: Outer? = null;

    init() {
        self.data = Outer{
            inner: Inner{ foo: 42 },
            flag: true
        };
    }
}