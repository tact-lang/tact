struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    a: Bool;
    b: Inner?;
}

contract NestTest {
    data: Outer = Outer{
        a: true,
        b: null,
    };

    init() {
        self.data = Outer{
            a: false,
            b: Inner{ x: 1, y: 2 },
        };
    }
}