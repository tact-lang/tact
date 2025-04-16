struct Outer {
    n1: Int;
    s1: Inner;
    n2: Int;
    s2: Inner;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract Interleaved {
    data: Outer;

    init() {
        self.data = Outer{
            n1: 1,
            s1: Inner{ x: 2, y: null },
            n2: 3,
            s2: Inner{ x: 4, y: true },
        };
    }
}
