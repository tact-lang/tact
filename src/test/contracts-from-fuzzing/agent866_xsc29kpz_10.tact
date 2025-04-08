struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    x: Inner;
    y: Inner;
}

struct Outer {
    p: Mid;
    q: Mid;
}

contract MultiLevel {
    data: Outer;
    init() {
        self.data = Outer{
            p: Mid {
                x: Inner { a: 1, b: true },
                y: Inner { a: 2, b: false }
            },
            q: Mid {
                x: Inner { a: 3, b: false },
                y: Inner { a: 4, b: true }
            }
        };
    }
}