struct Nested {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    d: Nested;
    e: Bool;
    f: Int?;
}

contract DeepOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            d: Nested{ a: 5, b: null, c: true },
            e: false,
            f: 10
        };
    }
}