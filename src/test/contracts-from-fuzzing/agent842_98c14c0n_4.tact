struct Nested {
    inner: Inner;
}

struct Inner {
    foo: Int;
    bar: Int;
    baz: Bool?;
    qux: String;
}

contract MultiNested {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                foo: 10,
                bar: 20,
                baz: null,
                qux: "hello"
            }
        };
    }
}