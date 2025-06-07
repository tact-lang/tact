struct Nested {
    x: Int;
    y: Int;
}

struct Outer {
    a: Bool;
    b: Nested;
    c: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: true,
            b: Nested{ x: 1, y: 2 },
            c: null
        };
    }
}