struct Inner {
    a: Int;
    b: Bool?;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid: Mid;
    name: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner1: Inner{ a: 1, b: true },
                inner2: Inner{ a: 2, b: null }
            },
            name: "deep"
        };
    }
}
