struct Inner {
    a: Int?;
    b: String?;
}

struct Outer {
    x: Inner?;
    y: Inner;
}

contract OptNest {
    data: Outer;

    init() {
        self.data = Outer{
            x: null,
            y: Inner{ a: null, b: null }
        };
    }
}