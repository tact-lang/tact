struct Nested {
    a: Int;
    b: Bool?;
    c: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 42,
            b: true,
            c: Inner{ x: 1, y: false }
        };
    }
}