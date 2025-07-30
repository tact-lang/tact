struct Inner {
    x: Int = 10;
    y: Int?;
}

struct Outer {
    sub: Inner;
    note: String?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            sub: Inner{ y: 123 },
            note: null
        };
    }
}