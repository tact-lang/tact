struct Inner {
    a: Int = 777;
    b: Bool?;
}

struct Outer {
    x: Inner;
    y: Int?;
}

contract DefaultAndOption {
    s: Outer;

    init() {
        self.s = Outer{
            x: Inner{ a: 123, b: true },
            y: null
        };
    }
}
