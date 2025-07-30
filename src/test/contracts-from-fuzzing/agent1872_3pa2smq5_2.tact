struct Nested {
    x: Int;
    y: String;
}

struct Outer {
    inner: Nested;
    b: Bool;
    s: String?;
}

contract NestDeep {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Nested{
                x: 42,
                y: "hello",
            },
            b: true,
            s: null,
        };
    }
}