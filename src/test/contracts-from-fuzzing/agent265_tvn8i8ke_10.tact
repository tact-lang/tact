struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Mid {
    inner1: Inner;
    inner2: Inner?;
}

struct Outer {
    m1: Mid;
    m2: Mid?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{
                inner1: Inner{ a: 1, b: null, c: "abc" },
                inner2: null,
            },
            m2: null,
        };
    }
}