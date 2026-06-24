struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Inner;
    y: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            x: Inner{ a: 1, b: true },
            y: 5,
        };
    }
}
