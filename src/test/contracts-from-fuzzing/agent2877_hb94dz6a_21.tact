struct Inner {
    s: String;
    n: Int;
}

struct Outer {
    x: Inner;
    y: Int;
}

contract InitDefaults {
    data: Outer = Outer{
        x: Inner{ s: "hi", n: 1 },
        y: 2,
    };

    init() {
        self.data = Outer{
            x: Inner{ s: "bye", n: 66 },
            y: 77,
        };
    }
}