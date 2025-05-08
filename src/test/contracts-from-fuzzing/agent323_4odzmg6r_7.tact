struct Inner {
    foo: Int = 5;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    baz: String = "default";
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                foo: 10,
                bar: null,
            },
            baz: "override",
        };
    }
}