struct Nested {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    inner: Nested;
    value: Bool;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Nested{
                foo: 1,
                bar: null
            },
            value: true
        };
    }
}