struct Nested {
    x: Int;
    y: Int?;
}

struct Outer {
    foo: Bool;
    bar: Nested;
    baz: String?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            foo: true,
            bar: Nested{x: 1, y: null},
            baz: "hello"
        };
    }
}