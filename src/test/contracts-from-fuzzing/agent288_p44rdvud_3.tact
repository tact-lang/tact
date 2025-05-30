struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    first: Inner;
    second: Inner?;
}

contract Test {
    data: Outer = Outer{ first: Inner{ a: null, b: null }, second: null };

    init() {
        self.data = Outer{
            first: Inner{ a: 42, b: true },
            second: null
        };
    }
}