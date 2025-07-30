struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    baz: Int;
    inner: Inner;
    qux: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            baz: 1,
            inner: Inner{
                foo: 2,
                bar: true,
            },
            qux: "hello",
        };
    }
}
