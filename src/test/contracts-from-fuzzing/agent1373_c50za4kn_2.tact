struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ inner: Inner{ foo: 42 } };
    }
}